# vim: set ft=python:


class ssh_packages {

    Package { ensure => 'present' }
    package { 'openssh-server': }
    package { 'openssh': }
}


class ssh_configs {

    require ssh_packages

    file { 'ssh_config':
        path   => "/etc/ssh/ssh_config",
        ensure => file,
        owner  => root,
        group  => root,
        mode   => 0644,
        source => "puppet://$puppetmaster/modules/packages/ssh_config",
        before => file['sshd_config']
    }

    file { 'sshd_config':
        path    => "/etc/ssh/sshd_config",
        ensure  => file,
        owner   => root,
        group   => root,
        mode    => 0600,
        source  => "puppet://$puppetmaster/modules/packages/sshd_config",
        require => file['ssh_config'],
        notify  => Class['ssh_service']
    }
}


class ssh_service {

    require ssh_packages
    require ssh_configs

    service { 'sshd':
        ensure  => running,
        enable  => true,
    }
}


class packages::ssh {

    include ssh_packages
    include ssh_configs
    include ssh_service
}
