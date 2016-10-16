class repos {
  include repos::base
  include repos::additional
  include repos::yum_clean_all
  include repos::remove_unknown_repos
  tag 'repos'
}
