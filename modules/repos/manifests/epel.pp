class repos::epel {
  yumrepo { 'epel':
    descr             => 'epel',
    gpgcheck          => 0,
    enabled           => 1,
    mirrorlist        => 'https://mirrors.fedoraproject.org/metalink?repo=epel-$releasever&arch=$basearch',
    mirrorlist_expire => '7200',
    failovermethod    => 'priority',
  }
}

#TODO: GPG check


