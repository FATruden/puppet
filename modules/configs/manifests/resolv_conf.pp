class configs::resolv_conf (
  $nameserver0 = '8.8.4.4',
  $nameserver1 = '8.8.8.8'
  ){

  $resolv_conf = @(EOF)
  search <%= $::domain_suffix %>
  nameserver <%= $nameserver0 %>
  nameserver <%= $nameserver1 %>
  | EOF

  file{ '/etc/resolv.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => inline_epp($resolv_conf),
  }
}
