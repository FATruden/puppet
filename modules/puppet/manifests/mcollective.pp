# == Class: puppet::mcollective (
#
class puppet::mcollective (
  $server = false,
  $client = false,
  $middleware = {},
  ) {

  if empty($middleware) {

    notify {'hash - "puppet::mcollective::middleware:" must be set!':
      loglevel => err,
    }
    fail('hash - "puppet::mcollective::middleware:" must be set!')
  }

  File {
    ensure  => file,
    content => template('puppet/etc/puppetlabs/mcollective/mcollective.cfg.erb'),
    notify  => Service['mcollective'],
  }

  if $server {

    file { '/etc/puppetlabs/mcollective/server.cfg':}
  }

  if $client {

    file { '/etc/puppetlabs/mcollective/client.cfg':}
  }
}
