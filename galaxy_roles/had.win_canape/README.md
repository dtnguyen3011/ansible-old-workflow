Requirements
------------

none.

Role Variables
--------------

Variable | Required | Default | Description
-------- | -------- | ------- | -----------
`win_canape_install_dir` | no | `C:\Program Files\canape` |  Target directory for installation
`win_canape_package_version` | no | `CANape18SP4` |  Tool version
`win_canape_force_install` | no | `false` |  Force run install, skip pre-check step

Dependencies
------------

none.

Example Playbook
----------------

    - hosts: servers
      roles:
        - { role: had.win_canape, tags: ["win_canape","init"] }

Maintainer
------------------

XC-DA RADAR Continuous X (xcdaradarcontinuousx@bosch.com):
- Jia Lu (XC-DA/EAS3): Lu.Jia@de.bosch.com