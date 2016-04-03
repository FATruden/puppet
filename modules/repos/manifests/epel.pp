class repos::epel {

    yumrepo { "epel":
        name              => "epel",
        ensure            => present,
        descr             => "epel repo",
        gpgcheck          => false,
        enabled           => true,
        mirrorlist        => 'https://mirrors.fedoraproject.org/metalink?repo=epel-$releasever&arch=$basearch',
        mirrorlist_expire => 7200,
        failovermethod    => priority,
    }
}

#TODO: GPG check


