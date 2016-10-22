```
repos_base:
  base:
    descr: base
    mirrorlist: 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os&infra=$infra'
    priority: 50
  updates:
    descr: updates
    mirrorlist: 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=updates&infra=$infra'
    priority: 50
  extras:
    descr: extras
    mirrorlist: 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=extras&infra=$infra'
    priority: 51
  epel:
    descr: epel
    mirrorlist: 'https://mirrors.fedoraproject.org/metalink?repo=epel-$releasever&arch=$basearch'
  puppet:
    descr:   puppet
    baseurl: 'http://yum.puppetlabs.com/el/$releasever/PC1/$basearch'
    enabled: 0
  puppet-source:
    descr:    puppet-source
    baseurl: 'http://yum.puppetlabs.com/el/$releasever/PC1/SRPMS'
    enabled: 0
```

```
repos_additional:
  xxxxx:
    descr: xxxxx
    baseurl: 'https://xxxx'
```
