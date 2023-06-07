win_python
=========

Installation of python 2.7.2 for windows.

Requirements
------------

none.

Role Variables
--------------

Variable | Required | Default | Description
-------- | -------- | ------- | -----------
`win_python_install_dir` | no | `C:\Python27` |  Target directory for installation

Dependencies
------------

none.

Example Playbook
----------------

```yml
    - hosts: servers
      roles:
        - { role: win_python, tags: ["win_python","init"] }
```

Maintainer
------------------

NRC2 Automation Team (ccdanrcs2automationscrumteam@bosch.com):
- Klich Marc (CC-AD/ESW2): Marc.Klich@de.bosch.com
- Bartmann Sebastian (CC-DA/EPA3): Sebastian.Bartmann@de.bosch.com
- Cieslar Matthias (CC-DA/EPA2): Matthias.Cieslar@de.bosch.com