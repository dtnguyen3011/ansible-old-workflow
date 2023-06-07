win_vs2015
=========

Installation of Visual Studio 2015 for windows.

Requirements
------------

none.

Role Variables
--------------

Variable | Required | Default | Description
-------- | -------- | ------- | -----------
`win_vs2015_pid` | no | `{12B68AD4-A9C9-3330-BFAE-BFCCDDB96660}` |  Product id related to the installation
`win_vs2015_force_install` | no | `false` |  Force run install, skip pre-check step

Dependencies
------------

none.

Example Playbook
----------------

```yml
    - hosts: servers
      roles:
        - { role: had.win_vs2015, tags: ["win_vs2015","init"] }
```

Maintainer
------------------

NRC2 Automation Team (ccdanrcs2automationscrumteam@bosch.com):
- Klich Marc (CC-AD/ESW2): Marc.Klich@de.bosch.com
- Bartmann Sebastian (CC-DA/EPA3): Sebastian.Bartmann@de.bosch.com
- Cieslar Matthias (CC-DA/EPA2): Matthias.Cieslar@de.bosch.com