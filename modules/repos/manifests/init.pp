# == Class: repos
#
class repos (
  Boolean $remove_unknown = true,
  ) {
  tag 'repos'

  include repos::yum_clean_all
  include repos::remove_unknown_repos

  # deeper merge. Only work with hiera_hash(
  $list    = hiera_hash('repos::list', {})
  $default = hiera_hash('repos::default', {})

  if ! empty($list) {
    create_resources(yumrepo, $list, $default)
  }
}
