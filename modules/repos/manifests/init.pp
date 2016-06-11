class repos {
  include repos::remove_unknown_repos
  include repos::base
  include repos::additional
  tag 'repos'
}
