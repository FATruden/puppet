class ssh::services {
  require ssh::packages
  require ssh::configs

  service { 'sshd':
    ensure => 'running',
    enable => true,
  }
}
