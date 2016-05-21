class chrony::config (
  $use_pool    = true,
  $pool        = 'pool.ntp.org',
  $servers     = ['a', 'b', 'c'],
  $for_clients = ['2.ru.pool.ntp.org', '3.ru.pool.ntp.org']
  ) {
  require chrony::install

  if $::roles and $::roles['chrony'] {
    $is_server = true
  }
  else {
    $is_server = false
  }

  file { '/etc/chrony.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('chrony/chrony.conf.erb'),
    notify  => Class['chrony::service'],
  }
}
