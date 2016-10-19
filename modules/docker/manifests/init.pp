class docker (
  # Block device for docker store
  String $volume = '',
  ){

  if ( $::facts['os']['release']['major'] == '7' ) {
    include docker::install
    include docker::make_volume
    include docker::config
    include docker::service
  }
  else {
    notify { "Docker: System isn't 'el7'! Supported only 'el7'!":
      loglevel => warning,
    }
  }
}
