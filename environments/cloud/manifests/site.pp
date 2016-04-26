#-----------------
# Global variables
#-----------------

$domain_suffix = hiera('domain_suffix')
$roles = hiera_array('roles', undef)
$ns1 = hiera('ns1')
$ns2 = hiera('ns2')


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
  if $roles {
    $roles.each |$role| {
      if $role['dns_server'] {
        $dns_server_iface = $role['dns_server']['dns_server_iface']
        $dns_server_forward1 = $role['dns_server']['dns_server_forward1']
        $dns_server_forward2 = $role['dns_server']['dns_server_forward2']
        # override resolve_conf variables
        $resolv_ns1 = $facts['ipaddress_lo']
        $resolv_ns2 = $::ns2
      }
      else {
        $resolv_ns1 = $::ns1
        $resolv_ns2 = $::ns2
      }
      include base
    }
  }
  # for role-less nodes
  include base
}
