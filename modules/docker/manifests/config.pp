class docker::config {
  require docker::make_volume

  if ! empty($::docker::volume) {

    $daemon_json = @(EOF)
    {
      "storage-driver": "<%= $::docker::storage_driver %>",
      "storage-opts": []
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
