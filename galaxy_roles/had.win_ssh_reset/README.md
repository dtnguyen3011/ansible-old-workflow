win_ssh_reset
=========

Resets the SSH connection and restarting the ssh service on a windows machine.
This is used to reload environment variables.

Requirements
------------

none.

Role Variables
--------------

Variable | Required | Default | Description
-------- | -------- | ------- | -----------

Dependencies
------------

none.

Example Playbook
----------------

```yml
    - hosts: servers
      roles:
        - { role: win_ssh_reset, tags: ["win_ssh_reset","init"] }
```

Maintainer
------------------

NRC2 Automation Team (ccdanrcs2automationscrumteam@bosch.com):
- Klich Marc (CC-AD/ESW2): Marc.Klich@de.bosch.com
- Bartmann Sebastian (CC-DA/EPA3): Sebastian.Bartmann@de.bosch.com
- Cieslar Matthias (CC-DA/EPA2): Matthias.Cieslar@de.bosch.com