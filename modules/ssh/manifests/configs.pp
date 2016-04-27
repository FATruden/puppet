class ssh::configs {

  require ssh::packages

  create_ssh_configs { '/etc/ssh/ssh_config': mode => '644' }
  create_ssh_configs { '/etc/ssh/sshd_config': mode => '600' }
}

define create_ssh_configs ($mode) {
  file { $name:
    owner  => 'root',
    group  => 'root',
    mode   => $mode,
    source => "puppet:///modules/ssh${name}",
    notify => Class['ssh::services']
  }
}
