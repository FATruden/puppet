class docker::make_volume {
  require docker::install

  if ( $::docker::volume != '' ) {

    exec { 'mkfs_docker_volume':
      command => "mkfs -t xfs -n ftype=1 ${::docker::volume} -f",
      unless  => "mount | grep ${::docker::volume} 2>/dev/null",
      path    => [ '/bin', '/usr/sbin/' ],
    }

    file { '/var/lib/docker':
      ensure  => directory,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      require => Exec['mkfs_docker_volume'],
    }

    mount { '/var/lib/docker':
      ensure  => mounted,
      device  => $::docker::volume,
      fstype  => 'xfs',
      dump    => 0,
      require => File['/var/lib/docker'],
    }

    augeas { 'add_volume_to_fstab':
        context => '/files/etc/fstab',
        changes => [
            "set 01/spec ${::docker::volume}",
            'set 01/file /var/lib/docker',
            'set 01/vfstype xfs',
            'set 01/opt defaults',
            'set 01/dump 0',
            'set 01/passno 0',
            ],
        onlyif  => "match *[spec='${::docker::volume}'][file = '/var/lib/docker'] size == 0",
        require => Mount['/var/lib/docker'],
    }
  }
}
