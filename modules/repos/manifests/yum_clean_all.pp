# == Class: repos::remove_unknown_repos
#
class repos::yum_clean_all {

  exec { 'yum_clean_all':
    command => 'yum clean all',
    path    => '/usr/bin/',
  }
}
