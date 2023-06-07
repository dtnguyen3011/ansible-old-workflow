win_notepad
=========

Installation of notepad for windows.

Requirements
------------

none.

Role Variables
--------------

Variable | Required | Default | Description
-------- | -------- | ------- | -----------
`win_notepad_install_dir` | no | `C:\Program Files\Notepad++` |  Target directory for installation
`win_notepad_package_name` | no | `npp.7.9.3.Installer.exe` |  Full name of the nodepad++ installer to be used.
`win_notepad_force_install` | no | `false` |  Force run install, skip pre-check step

Dependencies
------------

none.

Example Playbook
----------------

    - hosts: servers
      roles:
        - { role: had.win_notepad, tags: ["win_notepad","init"] }

Maintainer
------------------

XC-DA RADAR Continuous X (xcdaradarcontinuousx@bosch.com):
- Jia Lu (XC-DA/EAS3): Lu.Jia@de.bosch.com
- Lam Trien Lap (MS/EDA15): Lap.LamTrien@vn.bosch.com
