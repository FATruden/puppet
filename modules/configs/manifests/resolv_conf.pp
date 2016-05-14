class configs::resolv_conf {
  file{ '/etc/resolv.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('configs/resolv.conf.erb'),
  }
}
