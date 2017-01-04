# chrony

#### Table of Contents

1. [Description](#description)
2. [Setup](#setup)
3. [Usage - Configuration options and additional functionality](#usage)

## Description

Installing and configuring the docker daemon and docker containers.

## Setup

`include docker`

or use hiera:

```
classes:
 - docker
```

## Usage

All options have same names that in compose file, exclude `ensure`, it's puppet specifix.

```
docker::run {'containet_name':
  ensure       => 'present',
  image        => 'image_name',
  depends_on   => ['container1', 'container2'],
  volumes      => ['/var:/var'],
  environment  => ['VAR=123', 'VAR2=1232'],
  ports        => ['80:81'],
  network_mode => 'host',
  extra_hosts  => ['repo:172.25.6.71'],
  extra_params => ['--hostname=TEST', '--cpu-shares=100', '--privileged',],
  command      => 'ping 127.0.0.01',
```

`image` is required!

from hiera:

Configure the docker daemon(it's optional):

```
docker::volume: '/dev/dev_name'
docker::storage_driver: 'overlay|btrfs'
```

run containers:

```
docker::run_instance::instance:
  test1:
    #ensure: absent
    image: 'alpine'
    volumes: ['/var:/var', '/opt:/opt']
    network_mode: 'host'
    environment: ['TEST=1213', 'TEST3=ttt']
    extra_params: [ '--hostname=TEST', '--cpu-shares=100', '--privileged', ]
    command: 'ping 10.200.77.4'
  test2:
    #ensure: absent
    image: 'alpine'
    depends_on: ['test1']
    ports: ['85:85']
    command: 'ping 10.200.77.4'
  test3:
    #ensure: absent
    image: 'alpine'
    depends_on: ['test2']
    ports: ['88:88']
    command: 'ping 10.200.77.4'
```

`image` is required!


`ensure` (present|absent)     - default is 'present'
`network_mode` (default|host) - network mod like key `--network`. default is 'default'
`extra_hosts` - add entry to /etc/hosts like key `--add-host host:ip`
`extra_params`                - additional docker run parameters with original syntax
