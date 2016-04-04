class base_packages::install {
    package { [
            mtr,
            screen,
            strace,
            sysstat,
            tcpdump,
            yum-plugin-priorities,
            ]: ensure => present,
    }
}
