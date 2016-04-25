class dnsmasq {
  include dnsmasq::packages
  include dnsmasq::configs
  include dnsmasq::services
}
