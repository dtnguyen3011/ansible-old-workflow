win_greenhills_ifx
=========

Installation of greenhills_ifx for windows.

Requirements
------------

none.

Role Variables
--------------

Variable | Required | Default | Description
-------- | -------- | ------- | -----------
`greenhills_ifx_install_dir` | no | `C:\TCC\Tools\greenhills_ifx\comp_201815_5fp_WIN64` |  Target directory for installation

Dependencies
------------

none.

Example Playbook
----------------

```yml
    - hosts: servers
      roles:
        - { role: win_greenhills_ifx, tags: ["win_greenhills_ifx","init"] }
```

Maintainer
------------------

XC-DA RADAR Continuous X (xcdaradarcontinuousx@bosch.com):
- Jia Lu (XC-DA/EAS3): Lu.Jia@de.bosch.com