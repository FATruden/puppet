# == Class: puppet::config
#
class puppet::config {
  $agent_conf = @(EOF)
  # THIS FILE MANAGED BY PUPPET!
  [agent]
  server=puppet.<%= $::facts['domain'] %>
  | EOF

  file {'/etc/puppetlabs/puppet/puppet.conf':
    content => inline_epp($agent_conf),
    notify  => Service['puppet'],
  }
}
