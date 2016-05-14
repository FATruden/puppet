class dnsmasq::services {
  require dnsmasq::packages
  require dnsmasq::configs

  service { 'dnsmasq':
    ensure => 'running',
    enable => true,
  }
}
