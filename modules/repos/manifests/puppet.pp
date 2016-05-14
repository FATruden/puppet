class repos::puppet {
  Yumrepo {
    ensure   => 'present',
    gpgcheck => 0,
    enabled  => 1,
    priority => 95,
  }

  yumrepo { 'puppet':
    descr   => 'puppet',
    baseurl => 'http://yum.puppetlabs.com/el/$releasever/products/$basearch',
  }

  yumrepo { 'puppet-deps':
    descr   => 'puppet-deps',
    baseurl => 'http://yum.puppetlabs.com/el/$releasever/dependencies/$basearch',
  }
}

#TODO: GPG check


