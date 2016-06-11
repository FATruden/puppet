class repos::base {
  require repos::remove_unknown_repos
  tag 'repos_base'

  $base_default = hiera_hash('repos_default', {})
  $base = hiera_hash('repos_base', undef)

  if $base {
    create_resources(yumrepo, $base, $base_default)
  }
}

#TODO: GPG check


