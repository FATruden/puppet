class chrony::config{
  require chrony::install

  file { '/etc/chrony.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('chrony/chrony.conf.erb'),
    notify  => Class['chrony::service'],
  }
}
