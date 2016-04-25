class ssh::configs {
  require ssh::packages

  file { '/etc/ssh/ssh_config':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/ssh/ssh_config',
    before => File['/etc/ssh/sshd_config']
  }

  file { '/etc/ssh/sshd_config':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    source  => 'puppet:///modules/ssh/sshd_config',
    require => File['/etc/ssh/ssh_config'],
    notify  => Class['ssh::services']
  }
}
