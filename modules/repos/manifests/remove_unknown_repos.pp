class repos::remove_unknown_repos {

  resources { 'yumrepo':
    purge  => true,
  }
}
