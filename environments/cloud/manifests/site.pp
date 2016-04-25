#-----------------
# Global variables
#-----------------

$ns1 = hiera('ns1')
$ns2 = hiera('ns2')
$domain_suffix = hiera('domain_suffix')
$roles = hiera_array('roles', undef)

# dns_server options
$dns_server_iface = hiera('dns_server_iface', 'eth0')


# ------
# Stages
# ------

stage { [ 'configs','repos','packages','ssh', 'dnsmasq' ]: }


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


# ----------------
# Nodes definition
# ----------------

node default {
  include base

  if 'dns_server' in $roles {
    include dns_server
  }
}
