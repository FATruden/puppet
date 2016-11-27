class docker::install {
  #include repository::docker_el7

  package { 'docker-engine': }
}
