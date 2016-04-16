class repos::puppet {

    yumrepo { 'puppet':
        ensure            => 'present',
        descr             => "Puppet Labs Products",
        gpgcheck          => false,
        enabled           => true,
        priority          => 95,
        baseurl           => 'http://yum.puppetlabs.com/el/$releasever/products/$basearch',
    }
    yumrepo { 'puppet-deps':
        name              => 'puppet-deps',
        ensure            => 'present',
        descr             => 'Puppet Labs Dependencies',
        gpgcheck          => false,
        enabled           => true,
        priority          => 95,
        baseurl           => 'http://yum.puppetlabs.com/el/$releasever/dependencies/$basearch',
    }
}

#TODO: GPG check


