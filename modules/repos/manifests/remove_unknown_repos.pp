# == Class: repos::remove_unknown_repos
#
class repos::remove_unknown_repos {
  require repos::yum_clean_all

  if ( $::repos::remove_unknown ) {
    resources { 'yumrepo':
      purge  => true,
    }
  }
}
