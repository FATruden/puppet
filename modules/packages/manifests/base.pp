class packages::base {
    package { [
            yum-plugin-priorities,
            mtr,
            screen,
            strace,
            sysstat,
            tcpdump,
            ]: ensure => present,
    }
}
