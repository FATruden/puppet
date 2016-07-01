class openvpn {
  include openvpn::install
  include openvpn::config
  include openvpn::service
  tag 'openvpn'
}
