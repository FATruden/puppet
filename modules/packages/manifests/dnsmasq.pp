# vim: set ft=python:


class dnsmasq_package {

    Package { ensure => 'present' }
    package { 'dnsmasq': }
}



class dnsmasq_config {

    require dnsmasq_package

    file { '/etc/dnsmasq.conf':
        ensure  => 'file',
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        content => template('packages/etc/dnsmasq.erb'),
        notify  => Class['dnsmasq_service']
    }
}


class dnsmasq_service {

    require dnsmasq_package
    require dnsmasq_config

    service { 'dnsmasq':
        ensure  => 'running',
        enable  => 'true',
    }
}


class packages::dnsmasq {

    include dnsmasq_package
    include dnsmasq_config
    include dnsmasq_service
}
