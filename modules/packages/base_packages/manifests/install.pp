class base_packages::install {
    package { [
            mtr,
            screen,
            strace,
            sysstat,
            tcpdump,
            vim-enhanced,
            yum-plugin-priorities,
            ]: ensure => present,
    }
}
