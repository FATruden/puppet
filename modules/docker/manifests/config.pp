class docker::config {
  require docker::make_volume

  $daemon_json = @(EOF)
  {
    "storage-driver": "overlay",
    "storage-opts": []
  }
  | EOF

  file { '/etc/docker':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  file { '/etc/docker/daemon.json':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => inline_epp($daemon_json),
    require => File['/etc/docker'],
  }
}
