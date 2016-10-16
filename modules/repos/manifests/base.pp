class repos::base {
  require repos::yum_clean_all
  tag 'repos_base'

  $base_default = hiera_hash('repos_default', {})
  $base = hiera_hash('repos_base', undef)

  if $base {
    create_resources(yumrepo, $base, $base_default)
  }
}

#TODO: GPG check


