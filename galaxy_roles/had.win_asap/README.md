Requirements
------------

none.

Role Variables
--------------

Variable | Required | Default | Description
-------- | -------- | ------- | -----------
`win_asap_install_dir` | no | `C:\Program Files\Vector` |  Target directory for installation
`win_asap_version_dir` | no | `ASAP2 Tool-Set 15.0` |  Folder of installed version, based on win_asap_package_version
`win_asap_package_version` | no | `V15.0_SP6` |  Installation version
`win_asap_uninstall_version` | no | `None` |  Uninstallation version (Ex: "15.0 SPX")
`win_asap_action` | no | `install` |  Flag to sepecify action will be done (install/check/delete/force_install)

Dependencies
------------

none.

Example Playbook
----------------

    - hosts: servers
      roles:
        - { role: had.win_asap, tags: ["win_asap","init"] }
        - { role: had.win_asap, tags: ["win_asap","init"], win_asap_action: "check" }
        - { role: had.win_asap, tags: ["win_asap","init"], win_asap_action: "delete", win_asap_uninstall_version: "15.0 SPX" }
        - { role: had.win_asap, tags: ["win_asap","init"], win_asap_package_version: "V16.0_SP5_Beta", win_asap_version_dir: "ASAP2 Tool-Set 16.0" }
        - { role: had.win_asap, tags: ["win_asap","init"], win_asap_package_version: "V15.0_SP6", win_asap_version_dir: "ASAP2 Tool-Set 15.0" } # Default

Maintainer
------------------

XC-DA RADAR Continuous X (xcdaradarcontinuousx@bosch.com):
- Jia Lu (XC-DA/EAS3): Lu.Jia@de.bosch.com
- Lam Trien Lap (MS/EDA22): Lap.LamTrien@vn.bosch.com
