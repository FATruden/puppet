class repos::remove_unknown_repos {

  if ( $::repos::remove_unknown ) {
    resources { 'yumrepo':
      purge  => true,
    }
  }
}
