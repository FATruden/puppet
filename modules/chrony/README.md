# chrony

#### Table of Contents

1. [Description](#description)
2. [Setup](#setup)
3. [Usage - Configuration options and additional functionality](#usage)

## Description

Installing and configuring the chrony daemon for time synchronization.

## Setup

`include chrony`

or use hiera:

```
classes:
 - chrony
```

## Usage

```
class {'chrony':
  is_server      => false,
  use_pool       => true,
  pool           => 'pool.ntp.org',
  server_allow   => []
  server_servers => [ '0.ru.pool.ntp.org', '2.ru.pool.ntp.org', '3.ru.pool.ntp.org'],
  client_servers => [ '0.ru.pool.ntp.org', '2.ru.pool.ntp.org', '3.ru.pool.ntp.org'],
}
```

from hiera:

```
chrony::is_server: false
chrony::use_pool: true
chrony::pool: 'pool.ntp.org'
chrony::server_servers: [ '0.ru.pool.ntp.org', '2.ru.pool.ntp.org', '3.ru.pool.ntp.org']
chrony::client_servers: [ '0.ru.pool.ntp.org', '2.ru.pool.ntp.org', '3.ru.pool.ntp.org']
chrony::server_allow: []
```

`is_server` (true|false) - is server who provide time for clients or client only.  
`use_pool` (true|false) - if `is_server => true`. Use pool for chose servers or not.  
`pool` - if `is_server => true` and `use_pool => true` set pool_name for chose servers.  
`server_servers` - if `is_server => true` and `use_pool => false` set list of server.  
`client_servers` - if `is_server => false` set list of servers for client.  
`server_allow` - if `is_server => true` clients network who can to sync with this server.  
