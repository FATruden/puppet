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

include packages
include ssh

node 'dh01.ruden.local' {
  include docker

  docker::run {'test1':
    image        => 'alpine',
    volumes      => ['/var:/var', '/opt:/opt'],
    network_mode => 'host',
    ports        => ['83:858',],
    environment  =>  ['TEST=hui', 'TEST3=hui3'],
    extra_params => [ '--hostname=TEST', '--cpu-shares=100', '--privileged', ],
    command      => 'ping 10.200.77.4'
  }

  docker::run {'test2':
    image      => 'alpine',
    depends_on => ['test3'],
    ports      => ['85:85'],
    command    => 'ping 10.200.77.4'
  }

  docker::run {'test3':
    image      => 'alpine',
    depends_on => ['test1'],
    ports      => ['86:86'],
    command    => 'ping 10.200.77.4'
  }
}
