# Manage any standalone packages

## in any.yaml

```
packages::list:
  xxx: {ensure: present}
  yyy: {ensure: absent}
```

if ``:merge_behavior: deeper` all found hashes will be merged in accordance with the priority.
