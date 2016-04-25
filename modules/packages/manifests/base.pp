class packages::base {
  $general = [ 'mlocate', 'screen', 'vim-enhanced', ]
  $net     = [ 'mtr', 'tcpdump', 'bind-utils' ]
  $system  = [ 'sysstat', 'strace', ]
  $other   = [ 'yum-plugin-priorities', ]

  Package { ensure => 'present' }
  package { $general: }
  package { $net: }
  package { $system: }
  package { $other: }
}
