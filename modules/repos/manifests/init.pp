class repos (
  Boolean $remove_unknown = true,
  ) {
  tag 'repos'
  include repos::base
  include repos::additional
  include repos::yum_clean_all
  include repos::remove_unknown_repos
}
