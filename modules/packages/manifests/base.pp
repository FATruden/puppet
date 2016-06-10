class packages::base {

  $base = hiera_hash('pkgs_base', undef)

  if $base {
    create_resources(package, $base, {})
  }
}
