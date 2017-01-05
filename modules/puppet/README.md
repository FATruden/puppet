# puppet

#### Table of Contents

1. [Description](#description)
2. [Setup](#setup)
3. [Usage - Configuration options and additional functionality](#usage)

## Description

configuring the puppet-agent daemon and mcollective server and client side.

## Setup

`include puppet`

or use hiera:

```
classes:
 - puppet
```

## Usage


```
```

from hiera:


```
puppet::server: true|false
```

if `true` - puppet will create symlinks for environments, hieradata in /etc/ppl/

mcollective settings:

```
puppet::mcollective::server: true|false
puppet::mcollective::client: true|false

puppet::mcollective::middleware:
  connector: 'rabbitmq'
  vhost: 'mcollective'
  host: 'hostname'
  user: 'mcollective'
  password: 'pass'
```

`server` - configure node as mcollective server
`client` - configure node as mcollective client
