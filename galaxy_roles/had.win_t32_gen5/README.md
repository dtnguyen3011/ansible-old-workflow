win_t32_gen5
=========

Installation of t32_gen5 for windows.

Requirements
------------

none.

Role Variables
--------------

Variable | Required | Default | Description
-------- | -------- | ------- | -----------
`t32_gen5_install_dir` | no | `C:\t32_gen5` |  Target directory for installation
`t32_gen5_additional_path_tools` | no | - |  List of additional tools to add to the path variable

Dependencies
------------

none.

Example Playbook
----------------

```yml
    - hosts: servers
      roles:
        - { role: win_t32_gen5, tags: ["win_t32_gen5","init"] }
```

Maintainer
------------------


XC-DA RADAR Continuous X (xcdaradarcontinuousx@bosch.com):
- Jia Lu (XC-DA/EAS3): Lu.Jia@de.bosch.com