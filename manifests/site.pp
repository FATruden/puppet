# Global variables
$ns1 = hiera('ns1')
$ns2 = hiera('ns2')
$domain_suffix = hiera('domain_suffix')
$roles = hiera_array('roles', undef)

#import 'nodes.pp'

# -----------------
# Classes => stages
# -----------------

class base {
	class {
		'configs': stage => configs,;
		'packages': stage => packages,;
	}
}


# ------------
# Stages order
# ------------

stage { [configs,packages]: }


# ----------------
# Nodes definition
# ----------------

node default {
	include base
}
