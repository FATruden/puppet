class docker::install {
  include docker::docker_repo_el7

  package { 'docker-engine': }
}
