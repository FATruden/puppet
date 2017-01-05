# docker::run_instance
class docker::run_instance (
  $instance = {},
  ) {

  if ! empty($instance) {
    create_resources(docker::run, $instance)
  }
}
