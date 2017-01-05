# == Class: packages
#
class packages {

  # deeper merge. Only work with hiera_hash(
  $list = hiera_hash('packages::list', {})

  if ! empty($list) {
    create_resources(package, $list, {})
  }
}
