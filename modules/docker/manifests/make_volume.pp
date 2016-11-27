# Configure storage driver for docker
class docker::make_volume {
  require docker::install

  if ! empty($::docker::volume) {
    notify{'EMPTY':}

    case $::docker::storage_driver {
      'overlay': {

        $mkfs_command = 'mkfs -t xfs -n ftype=1 -f'
        $fs_type      = 'xfs'
        $driver       = 'overlay'
      }
      'btrfs': {

        $mkfs_command = 'mkfs -t btrfs -f'
        $fs_type      = 'btrfs'
        $driver       = 'btrfs'
      }
      default: {}
    }

    file { '/var/lib/docker':
      ensure => directory,
      owner  => 'root',
      group  => 'root',
      mode   => '0755',
    }

    exec { 'mkfs_docker_volume':
      command => "${::docker::mkfs_command} ${::docker::volume}",
      unless  => "mount | grep ${::docker::volume} 2>/dev/null",
      path    => [ '/bin', '/usr/sbin/' ],
    }

    mount { '/var/lib/docker':
      ensure  => mounted,
      device  => $::docker::volume,
      fstype  => $::docker::fs_type,
      dump    => 0,
      require => File['/var/lib/docker'],
    }

    augeas { 'add_volume_to_fstab':
        context => '/files/etc/fstab',
        changes => [
            "set 01/spec ${::docker::volume}",
            'set 01/file /var/lib/docker',
            "set 01/vfstype ${::docker::fs_type}",
            'set 01/opt defaults',
            'set 01/dump 0',
            'set 01/passno 0',
            ],
        onlyif  => "match *[spec='${::docker::volume}'][file = '/var/lib/docker'] size == 0",
        require => Mount['/var/lib/docker'],
    }
  }
}
