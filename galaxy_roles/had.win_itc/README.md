win_itc
=========

Installation of itc for windows.

Requirements
------------

none.

Role Variables
--------------

Variable | Required | Default | Description
-------- | -------- | ------- | -----------
`win_itc2_install_dir` | no | `C:\TCC\itc2` |  Target directory for installation
`win_itc2_force_install` | no | `false` |  Force run install, skip pre-check step

Dependencies
------------

none.

Example Playbook
----------------

```yml
    - hosts: servers
      roles:
        - { role: had.win_itc, tags: ["win_itc","init"] }
```

Maintainer
------------------

XC-DA RADAR Continuous X (xcdaradarcontinuousx@bosch.com):
- Jia Lu (XC-DA/EAS3): Lu.Jia@de.bosch.com
- Lam Trien Lap (MS/EDA22): Lap.LamTrien@vn.bosch.com
