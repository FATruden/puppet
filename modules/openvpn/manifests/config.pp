class openvpn::config (
  String  $subnet      = '10.200.70.0 255.255.255.0',
  Boolean $redirect_gw = false,
  Array   $routes      = [],
  ) {
  require openvpn::install

  file { '/etc/openvpn/server.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('openvpn/server.conf.erb'),
    notify  => Class['openvpn::service'],
  }
}
