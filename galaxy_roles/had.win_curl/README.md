win_curl
=========

Installation of curl for windows.

Requirements
------------

none.

Role Variables
--------------

Variable | Required | Default | Description
-------- | -------- | ------- | -----------
`win_curl_install_dir` | no | `C:\Program Files\curl` |  Target directory for installation
`win_curl_package_version` | no | `7.85.0_4-win64-mingw` |  Installation version
`win_curl_force_install` | no | `false` |  Force run install

Dependencies
------------

none.

Example Playbook
----------------

    - hosts: servers
      roles:
        - { role: had.win_curl, tags: ["win_curl","init"] }
        - { role: had.win_curl, tags: ["win_curl","init"], win_curl_package_version: "7.58.0" }
        - { role: had.win_curl, tags: ["win_curl","init"], win_curl_force_install: "true" }

Maintainer
------------------

XC-DA RADAR Continuous X (xcdaradarcontinuousx@bosch.com):
- Jia Lu (XC-DA/EAS3): Lu.Jia@de.bosch.com
- Lam Trien Lap (MS/EDA15): Lap.LamTrien@vn.bosch.com
