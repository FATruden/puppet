class packages::additions {

  $additions = hiera_hash('pkgs_additions', undef)

  if $additions {
    create_resources(package, $additions, {})
  }
}
