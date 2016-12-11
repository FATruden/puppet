$tmp_dir      = '/tmp/puppet_repo'
$git_repo     = 'git@github.com:FATruden/puppet.git'
$env_base_dir = '/etc/puppetlabs/code/environments'
$default_ref  = 'master'
$default_env  = 'production'
$sync_dir     = [ 'modules', 'manifests', ]
$hiera_dir    = $facts['networking']['domain']

if ! empty($facts['ref']) {
  $ref_to_sync = $facts['ref']
}
else {
  $ref_to_sync = $default_ref
}

if ! empty($facts['env']) {
  $env_to_sync = $facts['env']
}
else {
  $env_to_sync = $default_env
}

File {
  ensure  => directory,
  recurse => true,
  purge   => true,
  force   => true,
}

Exec {
  path => [ '/bin', ]
}

file {$tmp_dir:
  ensure => absent,
}

exec {"git_clone_${git_repo}_${tmp_dir}":
  command => "git clone ${git_repo} ${tmp_dir}",
}

exec {"git_checkout_to_${ref_to_sync}":
  cwd     => $tmp_dir,
  command => "git checkout ${ref_to_sync}",
}

file{"${env_base_dir}/${env_to_sync}":}

# sync $sync_dir
$sync_dir.each | String $dir  | {
  file {"${env_base_dir}/${env_to_sync}/${dir}":
    source  => "${tmp_dir}/${dir}",
  }
}

#sync hieradata
file {"${env_base_dir}/${env_to_sync}/hieradata":
  source  => "${tmp_dir}/hieradata/${hiera_dir}"
}
