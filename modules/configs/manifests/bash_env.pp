class configs::bash_env {

    file{ 'bash_env.sh':
        path   => '/etc/profile.d/bash.env.sh',
        ensure => present,
        owner  => root,
        group  => root,
        mode   => 0644,
        source => 'puppet:///modules/configs/etc/profile.d/bash_env.sh',
    }
}
