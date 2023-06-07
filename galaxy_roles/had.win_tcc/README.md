win_tcc
=========

Installation of TCC for windows.

Requirements
------------

none.

Role Variables
--------------

Variable | Required | Default | Description
-------- | -------- | ------- | -----------
`tcc_install_dir` | no | `C:\TCC` |  Target directory for installation
`tcc_additional_path_tools` | no | - |  List of additional tools to add to the path variable

Dependencies
------------

none.

Example Playbook
----------------

```yml
    - hosts: servers
      roles:
        - { role: win_tcc, tags: ["win_tcc","init"] }
```

Maintainer
------------------

NRC2 Automation Team (ccdanrcs2automationscrumteam@bosch.com):
- Klich Marc (CC-AD/ESW2): Marc.Klich@de.bosch.com
- Bartmann Sebastian (CC-DA/EPA3): Sebastian.Bartmann@de.bosch.com
- Cieslar Matthias (CC-DA/EPA2): Matthias.Cieslar@de.bosch.com