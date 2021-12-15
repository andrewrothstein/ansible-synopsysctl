andrewrothstein.synopsysctl
=========

![Build Status](https://github.com/andrewrothstein/ansible-synopsysctl/actions/workflows/build.yml/badge.svg)

Installs BlackDuck Software's [synopsysctl](https://github.com/blackducksoftware/synopsysctl)

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.synopsysctl
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
