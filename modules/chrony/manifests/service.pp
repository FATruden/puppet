class chrony::service {
  require chrony::config

  service { 'chronyd':
    ensure => 'running',
    enable => true,
  }
}
