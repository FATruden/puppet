class ssh::packages {
  Package { ensure => 'present' }
  package { 'openssh-server': }
  package { 'openssh': }
}
