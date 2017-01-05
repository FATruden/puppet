# == Class: puppet
#
class puppet (
  $server = false,
  ) {
  include puppet::config
  include puppet::symlinks
  include puppet::service
  include puppet::mcollective
  include puppet::mcollective_plugins
}
