class docker::docker_repo_el7 {

  yumrepo { 'docker':
    descr   => 'docker_el7',
    baseurl => 'https://yum.dockerproject.org/repo/main/centos/7',
    gpgkey  =>  'https://yum.dockerproject.org/gpg',
  }
}
