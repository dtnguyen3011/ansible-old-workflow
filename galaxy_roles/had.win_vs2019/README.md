win_vs2019
=========

Installation of Visual Studio 2019 for windows.

Requirements
------------

none.

Role Variables
--------------

Variable | Required | Default | Description
-------- | -------- | ------- | -----------
`win_vs2019_install_dir` | no | `C:\\Program Files (x86)\\Microsoft Visual Studio\\2019` |  Target directory for installation
`win_vs2019_update_flag` | no | `false` |  Flag to update package
`win_vs2019_update_params` | no | "" |  Params for update package. Refer to https://docs.microsoft.com/en-us/visualstudio/install/use-command-line-parameters-to-install-visual-studio?view=vs-2019, https://docs.microsoft.com/en-us/visualstudio/install/workload-component-id-vs-professional?view=vs-2019&preserve-view=true
`win_vs2019_force_install` | no | `false` |  Force run install, skip pre-check step

Dependencies
------------

none.

Example Playbook
----------------

```yml
    - hosts: servers
      roles:
        - { role: had.win_vs2019, tags: ["win_vs2019","init"] }
```

```yml
    - hosts: servers_update
      roles:
        - { role: had.win_vs2019, tags: ["win_vs2019","init"], win_vs2019_update_params: "--add <Component ID> --remove <Component ID>" }
```

Maintainer
------------------

XC-DA RADAR Continuous X (xcdaradarcontinuousx@bosch.com):
- LAM TRIEN LAP (MS/EDA22): Lap.LamTrien@vn.bosch.com