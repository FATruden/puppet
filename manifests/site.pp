#-----------------
# Global variables
#-----------------

$domain_suffix = hiera('domain')
$roles         = hiera_hash('roles', undef)

hiera_include('classes')


# -----------------------
# Stages and requirements
# -----------------------

stage { 'configs': before => Stage['repos'] }
stage { 'repos':   before => Stage['main'] }


# -----------------
# Modules => stages
# -----------------

class {'configs':
  stage => 'configs',
}

class {'repos':
  stage => 'repos',
}


# ----------------
# Nodes definition
# ----------------

include chrony
include packages
include ssh
