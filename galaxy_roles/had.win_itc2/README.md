ITC2
=========

Installation of ITC2 for windows.

Requirements
------------

none.

Role Variables
--------------

Variable | Required | Default | Description
-------- | -------- | ------- | -----------
`tcc_install_dir` | no | `C:\TCC` |  Target directory for installation
`tcc_additional_path_tools` | no | - |  List of additional tools to add to the path variable
`tcc_install_tool_collection` | no | - |  Name of tool collection to install
`tcc_in_bdc` | no | false |  Set true to use bdc artifactory for install (this requires `tcc_artifactory_api_key` to be set aswell)
`tcc_installer_location_bcn` | no | \\abtvdfs2.de.bosch.com\ismdfs\ism\ito\TCC\itc2 |  Location to fetch tcc installer from when working in BCN
`tcc_artifactory_api_key` | yes | - | Artifactory API KEY
`tcc_installer_location_cloud` | no | https://artifactory.boschdevcloud.com/ui/native/lab000142-tcc-tools-local/itc2 |  Location to fetch tcc installer from when working in BDC
`tcc_user` | yes | - | System User to download and run updateITC2.exe from BCN
`tcc_user_password` | yes | - | System User password to download and run updateITC2.exe from BCN

Dependencies
------------

none.

Example Playbook
----------------

```yml
    - hosts: servers
      roles:
        - { role: win_itc2, tags: ["win_itc2","init"] }
```
