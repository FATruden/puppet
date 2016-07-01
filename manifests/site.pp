#-----------------
# Global variables
#-----------------

$domain_suffix = hiera('domain')
$roles         = hiera_hash('roles', undef)

hiera_include('classes')


# -----------------------
# Stages and requirements
# -----------------------

stage {
  'configs':,;
  'repos':,;
  'packages': require => Stage['repos'],;
  'ssh':,;
  'chrony':,;
  'dnsmasq':,;
  }


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
}

class ntp_server {
  class {
    'chrony': stage => 'chrony',
  }
}


# ----------------
# Nodes definition
# ----------------

node default {
  include base
  include ntp_server
}
