$tmp_dir = '/tmp/puppet_repo'
$git_repo = 'git@github.com:FATruden/puppet.git'
$branches = ['production']
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

exec {'co_to_branch':
  cwd     => $tmp_dir,
  command => "git checkout ${branches}[0]"
}
