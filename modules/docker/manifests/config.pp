class docker::config {
  require docker::make_volume

  if ! empty($::docker::volume) {

    $daemon_json = @(EOF)
    {
      "storage-driver": "<%= $::docker::storage_driver %>",
      "storage-opts": [],
      "hosts": [
        "tcp://0.0.0.0:2375",
        "unix:///var/run/docker.sock"
      ]
    }
    | EOF

    File {
      owner => 'root',
      group => 'root',
      mode  => '0644',
    }

    file { '/etc/docker':
      ensure => directory,
      mode   => '0755',
    }

    file { '/etc/docker/daemon.json':
      content => inline_epp($daemon_json),
      require => File['/etc/docker'],
      notify  => Class['docker::service']
    }
  }
}
