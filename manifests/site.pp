#-----------------
# Global variables
#-----------------

$domain_suffix = hiera('domain')
$roles         = hiera_hash('roles', undef)

hiera_include('classes')


# ------
# Stages
# ------

stage { [ 'configs','repos','packages','ssh', 'chrony', 'dnsmasq' ]: }


# -----------------
# Modules => stages
# -----------------

class base {
  class {
    'configs':  stage => 'configs',;
    'repos':    stage => 'repos',;
    'ssh':      stage => 'ssh',;
    'packages': stage => 'packages',;
  }
  Stage['configs'] -> Stage['repos'] -> Stage['ssh'] -> Stage['packages']
}

class dns_server {
  class {
    'dnsmasq': stage => 'dnsmasq',
  }
  Stage['packages'] -> Stage['dnsmasq']
}

class ntp_server {
  class {
    'chrony': stage => 'chrony',
  }
  Stage['dnsmasq'] -> Stage['chrony']
}


# ----------------
# Nodes definition
# ----------------

node default {
  if $::roles {
    if $::roles['dnsmasq'] {
      include dns_server
    }
    include base
    include ntp_server
  }
  # for role-less nodes
  include base
  include ntp_server
}
