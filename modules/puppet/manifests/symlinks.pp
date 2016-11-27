class puppet::symlinks {

  if ( $::facts['is_puppetserver'] == "true" ) {

    File {
      ensure => 'link'
    }

    file { '/etc/ppl':
      ensure => 'directory',
    }

    file { '/etc/ppl/puppet':
      target => '/etc/puppetlabs/puppet',
    }

    file { '/etc/ppl/puppetdb':
      target => '/etc/puppetlabs/puppetdb',
    }

    file { '/etc/ppl/puppetserver':
      target => '/etc/puppetlabs/puppetserver',
    }

    file { '/etc/ppl/hieradata':
      target => '/etc/puppetlabs/code/hieradata',
    }

    file { '/etc/ppl/env':
      target => '/etc/puppetlabs/code/environments',
    }
  }
}
