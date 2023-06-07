win_7z
=========

Installation of 7zip for windows.

Requirements
------------

none.

Role Variables
--------------

Variable | Required | Default | Description
-------- | -------- | ------- | -----------
`win_7z_install_dir` | no | `C:\Program Files\7-Zip` |  Target directory for installation
`win_7z_force_install` | no | `false` |  Force run install, skip pre-check step
`win_7z_version` | no | `7z1900-x64.exe` |  Full name of the 7z installer to be used.

Dependencies
------------

none.

Example Playbook
----------------

    - hosts: servers
      roles:
        - { role: win_7z, tags: ["win_7z","init"] }

Maintainer
------------------

NRC2 Automation Team (ccdanrcs2automationscrumteam@bosch.com):
- Klich Marc (CC-AD/ESW2): Marc.Klich@de.bosch.com
- Bartmann Sebastian (CC-DA/EPA3): Sebastian.Bartmann@de.bosch.com
- Cieslar Matthias (CC-DA/EPA2): Matthias.Cieslar@de.bosch.com