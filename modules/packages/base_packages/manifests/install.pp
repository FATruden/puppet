class base_packages::install {
    package { [
            bind-utils,
            mtr,
            mlocate,
            screen,
            strace,
            sysstat,
            tcpdump,
            vim-enhanced,
            yum-plugin-priorities,
            ]: ensure => present,
    }
}
