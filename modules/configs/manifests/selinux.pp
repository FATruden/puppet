class configs::selinux (
  String $mode = enforcing,
  ) {

  augeas { 'selinux_config':
    context => '/files/etc/selinux/config',
    changes => "set SELINUX ${mode}",
    notify  => Exec[ 'setenforce_0', 'setenforce_1' ],
  }

  exec { 'setenforce_0':
    command     => 'setenforce 0',
    onlyif      => 'grep -E "SELINUX=disabled|SELINUX=permissive" /etc/selinux/config',
    path        => [ '/sbin', '/bin' ],
    refreshonly => true,
  }

  exec { 'setenforce_1':
    command     => 'setenforce 1',
    onlyif      => 'grep "SELINUX=enforcing" /etc/selinux/config',
    path        => [ '/sbin', '/bin' ],
    refreshonly => true,
  }
}
