# == Class: puppet::mcollective_plugins
#
class puppet::mcollective_plugins {

  if $::puppet::mcollective::server or $::puppet::mcollective::client {

    File {
      ensure  => directory,
      mode    => '0755',
      recurse => true,
    }

    file { '/usr/libexec/mcollective':}

    file { '/usr/libexec/mcollective/mcollective':
      source  => 'puppet:///files/mcollective',
      require => File['/usr/libexec/mcollective'],
      notify  => Service['mcollective'],
    }
  }
}
