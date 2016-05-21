class dnsmasq::config (
  $iface = 'eth0'
  ) {
  require dnsmasq::install

  file { '/etc/dnsmasq.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('dnsmasq/dnsmasq.erb'),
    notify  => Class['dnsmasq::service'],
  }
}
