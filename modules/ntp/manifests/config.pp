class ntp::config (
  $is_server   = false,
  $use_pool    = true,
  $pool        = 'pool.ntp.org',
  $allow       = '192.168.0.0/24',
  $servers     = ['a', 'b', 'c'],
  $for_clients = ['10.200.77.6']
  ) {

  file { '/etc/chrony.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('ntp/chrony.conf.erb'),
    require => Class['ntp::install'],
    notify  => Class['ntp::service'],
  }
}
