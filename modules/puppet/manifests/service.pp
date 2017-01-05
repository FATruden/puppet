# == Class: puppet::service
#
class puppet::service {
  require puppet::config
  require puppet::mcollective

  Service {
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }

  service { 'puppet': }

  if $::puppet::mcollective::server or $puppet::mcollective::client {

    service { 'mcollective': }
  }
}
