# root

#### Table of Contents

1. [Description](#description)
1. [Reference](#reference)
1. [Examples](#examples)

## Description

Manages the root user's account. Purges SSH keys.

## Reference

##### `password`
  Hashed root password as would be present in `/etc/shadow`

## Examples

~~~puppet

class { '::root':
    password => '<your password hash>',
}
~~~
