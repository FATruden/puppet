#-----------------
# Global variables
#-----------------

$domain_suffix = hiera('domain')
$nameservers   = hiera_array('nameservers')
$roles         = hiera_array('roles', undef)


# ------
# Stages
# ------

stage { [ 'configs','repos','packages','ssh', 'ntp', 'dnsmasq' ]: }


# -----------------
# Modules => stages
# -----------------

class base {
  class {
    configs:  stage => 'configs',;
    repos:    stage => 'repos',;
    ssh:      stage => 'ssh',;
    packages: stage => 'packages',;
  }
  Stage['configs'] -> Stage['repos'] -> Stage['ssh'] -> Stage['packages']
}

class dns_server {
  class {
    dnsmasq: stage => 'dnsmasq',
  }
  Stage['packages'] -> Stage['dnsmasq']
}

#class ntp_server {
#  class {
#    ntp: stage => 'ntp',
#  }
#  Stage['dnsmasq'] -> Stage['ntp']
#}


# ----------------
# Nodes definition
# ----------------

node default {
  if $roles {
    $roles.each |$role| {
      if $role['dns_server'] {
        # dns_server's specific options from hiera
        $dns_server_iface = $role['dns_server']['dns_server_iface']
        $dns_server_forward1 = $role['dns_server']['dns_server_forward1']
        $dns_server_forward2 = $role['dns_server']['dns_server_forward2']
        # override resolve_conf variables
        $nameservers = [ $facts['ipaddress_lo'], $::nameservers[1] ]
        include dns_server
      }
      include base
      include ntp
    }
  }
  # for role-less nodes
  include base
  include ntp
}
