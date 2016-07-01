class dnsmasq::config (
  String  $iface         = 'eth0',
  Boolean $allow_forward = false,
  Array   $forward_to    = [],
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
