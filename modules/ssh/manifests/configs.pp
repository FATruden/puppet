class ssh::configs {

  require ssh::packages

  ssh::create_ssh_configs { '/etc/ssh/ssh_config': mode => '644' }
  ssh::create_ssh_configs { '/etc/ssh/sshd_config': mode => '600' }
}
