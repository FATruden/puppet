class dnsmasq {
  include dnsmasq::install
  include dnsmasq::config
  include dnsmasq::service
}
