# == Class: puppet::symlinks
#
class puppet::symlinks {

  if $::puppet::server {

    File {
      ensure => 'link'
    }

    file { '/etc/ppl':
      ensure => 'directory',
    }

    file { '/etc/ppl/hieradata':
      target => '/var/lib/docker/data/puppetserver/hieradata',
    }

    file { '/etc/ppl/env':
      target => '/var/lib/docker/data/puppetserver/environments',
    }

    file { '/etc/ppl/ssl':
      target => '/var/lib/docker/data/puppetserver/ssl',
    }
  }
}
