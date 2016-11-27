# default params for module
class docker::params {
  $volume         = ''
  $storage_driver = 'btrfs'
  $service_prefix = 'docker'
  $docker_command = '/bin/docker'
  $default_flags  = ['--log-driver=none']
}
