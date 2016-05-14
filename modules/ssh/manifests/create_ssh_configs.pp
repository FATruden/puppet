define ssh::create_ssh_configs ($mode) {
  file { $name:
    owner  => 'root',
    group  => 'root',
    mode   => $mode,
    source => "puppet:///modules/ssh${name}",
    notify => Class['ssh::services']
  }
}
