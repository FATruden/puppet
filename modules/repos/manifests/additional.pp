class repos::additional {
  require repos::base
  tag 'repos_additional'

  $repos_default = hiera_hash('repos_default', {})
  $additional = hiera_hash('repos_additional', undef)

  if $additional {
    create_resources(yumrepo, $additional, $repos_default)
  }
}

#TODO: GPG check


