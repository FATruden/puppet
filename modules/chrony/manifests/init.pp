class chrony (
  Boolean $is_server      = false,
  Boolean $use_pool       = true,
  String  $pool           = 'pool.ntp.org',
  Array   $server_allow   = [],
  Array   $server_servers = [ '0.ru.pool.ntp.org', '2.ru.pool.ntp.org', '3.ru.pool.ntp.org'],
  Array   $client_servers = [ '0.ru.pool.ntp.org', '2.ru.pool.ntp.org', '3.ru.pool.ntp.org'],
  ) {

  include chrony::install
  include chrony::config
  include chrony::service
}
