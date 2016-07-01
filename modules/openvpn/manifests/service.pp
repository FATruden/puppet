class openvpn::service {
  require openvpn::config

  service { 'openvpn@server':
    ensure => 'running',
    enable => true,
  }
}
