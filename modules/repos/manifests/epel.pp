class repos::epel {
  yumrepo { 'epel':
    ensure            => 'present',
    descr             => 'epel repo',
    gpgcheck          => 0,
    enabled           => 1,
    mirrorlist        => 'https://mirrors.fedoraproject.org/metalink?repo=epel-$releasever&arch=$basearch',
    mirrorlist_expire => '7200',
    failovermethod    => 'priority',
  }
}

#TODO: GPG check


