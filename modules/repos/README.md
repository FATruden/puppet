# Manage yum repos

## in any.yaml

```
repos::default:
  gpgcheck: 0
  enabled:  1
  mirrorlist_expire: 7200
  failovermethod:    priority

repos::list:
  name1:
    descr: name-1
    mirrorlist: 'http://url/?release=$releasever&arch=$basearch&repo=os&infra=$infra'
    priority: 50
  name2:
    descr: name-2
    mirrorlist: 'http://url/?release=$releasever&arch=$basearch&repo=updates&infra=$infra'
    priority: 51
```

if `:merge_behavior: deeper` all found hashes will be merged in accordance with the priority.
