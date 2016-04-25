class repos::base {
  yumrepo { 'base':
    ensure            => 'present',
    descr             => 'CentOS-base repo',
    gpgcheck          => false,
    enabled           => true,
    priority          => 50,
    mirrorlist        => 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os&infra=$infra',
    mirrorlist_expire => '7200',
    failovermethod    => 'priority',
  }

  yumrepo { 'updates':
    ensure            => 'present',
    descr             => 'CentOS-update repo',
    gpgcheck          => false,
    enabled           => true,
    priority          => 50,
    mirrorlist        => 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=updates&infra=$infra',
    mirrorlist_expire => '7200',
    failovermethod    => 'priority',
  }

  yumrepo { 'extras':
    ensure            => 'present',
    descr             => 'CentOS-extras repo',
    gpgcheck          => false,
    enabled           => true,
    priority          => 51,
    mirrorlist        => 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=extras&infra=$infra',
    mirrorlist_expire => '7200',
    failovermethod    => 'priority',
  }

  yumrepo { 'centosplus':
    ensure            => 'present',
    descr             => 'CentOS-centosplus repo',
    gpgcheck          => false,
    enabled           => true,
    mirrorlist        => 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=centosplus&infra=$infra',
    mirrorlist_expire => '7200',
    failovermethod    => 'priority',
  }
}

#TODO: GPG check


