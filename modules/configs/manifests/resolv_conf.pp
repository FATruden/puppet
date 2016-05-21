class configs::resolv_conf (
  $nameserver0 = '8.8.4.4',
  $nameserver1 = '8.8.8.8'
  ){

  file{ '/etc/resolv.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('configs/resolv.conf.erb'),
  }
}
