class repos::yum_clean_all {
  require repos::remove_other_repos

  exec { 'yum_clean_all':
    command   => 'yum clean all',
    path      => '/usr/bin/',
    logoutput => 'on_failure',
  }
}
