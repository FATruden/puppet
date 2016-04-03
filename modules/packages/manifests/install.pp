class packages::install {
    package { [
            mtr,
            screen,
            strace,
            sysstat,
            tcpdump,
            ]: ensure => present,
    }
}
