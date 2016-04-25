class dnsmasq::configs {
  file { '/etc/dnsmasq.conf':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('dnsmasq/dnsmasq.erb'),
    require => Class['dnsmasq::packages'],
    notify  => Class['dnsmasq::services'],
  }
}
