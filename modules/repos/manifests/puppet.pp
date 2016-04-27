class repos::puppet {
  yumrepo { 'puppet':
    ensure   => 'present',
    descr    => "Puppet Labs Products",
    gpgcheck => 0,
    enabled  => 1,
    priority => 95,
    baseurl  => 'http://yum.puppetlabs.com/el/$releasever/products/$basearch',
  }

  yumrepo { 'puppet-deps':
    name     => 'puppet-deps',
    ensure   => 'present',
    descr    => 'Puppet Labs Dependencies',
    gpgcheck => 0,
    enabled  => 1,
    priority => 95,
    baseurl  => 'http://yum.puppetlabs.com/el/$releasever/dependencies/$basearch',
  }
}

#TODO: GPG check


