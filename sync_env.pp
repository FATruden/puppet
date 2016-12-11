$tmp_dir = '/tmp/puppet_repo'
$git_repo = 'git@github.com:FATruden/puppet.git'
$branches = [ 'production', ]
$sync_dir = ['modules', 'manifests']

notify{'Hello from sync':}

file {$tmp_dir:
  ensure => absent,
  force  => true
}

exec {'clone_repo':
  command => "git clone ${git_repo} ${tmp_dir}",
  path    => ['/bin/']
}

$branches.each |String $branch| {
  exec {"co_to_${branch}":
    cwd     => $tmp_dir,
    command => "git checkout ${branch}",
    path    => ['/bin/']
  }

  file {"/etc/puppetlabs/code/environments/${branch}/modules":
    ensure  => directory,
    recurse => true,
    source  => "${tmp_dir}/modules",
  }
  file {"/etc/puppetlabs/code/environments/${branch}/manifests":
    ensure  => directory,
    recurse => true,
    source  => "${tmp_dir}/manifests",
  }
}
