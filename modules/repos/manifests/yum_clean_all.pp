class repos::yum_clean_all {
  require repos::additional

  exec { 'yum_clean_all':
    command   => 'yum clean all',
    path      => '/usr/bin/',
    logoutput => 'on_failure',
  }
}
