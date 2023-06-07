win_hawcc
=========

Installation of hawcc for windows.

Requirements
------------

none.

Role Variables
--------------

Variable | Required | Default | Description
-------- | -------- | ------- | -----------
`hawcc_install_dir` | no | `C:\TCC\hawcc\2.9.7082.17600_beta4_WIN64` |  Target directory for installation

Dependencies
------------

none.

Example Playbook
----------------

```yml
    - hosts: servers
      roles:
        - { role: win_hawcc, tags: ["win_hawcc","init"] }
```

Maintainer
------------------

XC-DA RADAR Continuous X (xcdaradarcontinuousx@bosch.com):
- Jia Lu (XC-DA/EAS3): Lu.Jia@de.bosch.com