class ntp::service {
  require ntp::install
  require ntp::config

  service { 'chronyd':
    ensure => 'running',
    enable => true,
  }
}
