class configs::bash_env {
  file{ '/etc/profile.d/bash.env.sh':
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/configs/bash_env.sh',
  }
}
