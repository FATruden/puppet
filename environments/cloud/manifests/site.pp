#-----------------
# Global variables
#-----------------

$ns1 = hiera('ns1')
$ns2 = hiera('ns2')
$domain_suffix = hiera('domain_suffix')
$roles = hiera_array('roles', undef)


# ------------
# Stages
# ------------

stage { [configs,repos,packages]: }


# -----------------
# Classes => stages
# -----------------

class base {
    class {
        configs:  stage => configs,;
        repos:    stage => repos,;
        packages: stage => packages,;
    }
    Stage[configs] -> Stage[repos] -> Stage[packages]
}


# ----------------
# Nodes definition
# ----------------

node default {
    include base
}
