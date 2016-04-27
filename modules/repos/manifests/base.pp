class repos::base {
  Yumrepo {
    ensure            => 'present',
    gpgcheck          => 0,
    enabled           => 1,
    mirrorlist_expire => '7200',
    failovermethod    => 'priority',
  }

  yumrepo { 'base':
    priority   => 50,
    mirrorlist => 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os&infra=$infra',
  }

  yumrepo { 'updates':
    priority   => 50,
    mirrorlist => 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=updates&infra=$infra',
  }

  yumrepo { 'extras':
    priority   => 51,
    mirrorlist => 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=extras&infra=$infra',
  }

  yumrepo { 'centosplus':
    mirrorlist => 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=centosplus&infra=$infra',
  }
}

#TODO: GPG check
#TODO: Add repo descriptions
