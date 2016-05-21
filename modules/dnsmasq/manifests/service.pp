class dnsmasq::service {
  require dnsmasq::config

  service { 'dnsmasq':
    ensure => 'running',
    enable => true,
  }
}
