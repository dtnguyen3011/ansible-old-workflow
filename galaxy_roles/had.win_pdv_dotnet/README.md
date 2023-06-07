Requirements
------------

none.

Role Variables
--------------

Variable | Required | Default | Description
-------- | -------- | ------- | -----------
`win_pdv_dotnet_install_dir` | no | `C:\Program Files\dotnet` |  Target directory for installation
`win_pdv_dotnet_package_location` | no | `http://abtv55162.de.bosch.com:8084/doit-mirror/Microsoft/pdv_dotnet/` |  Path to download dotnet-runtime 
`win_pdv_dotnet_package_file` | no | `dotnet-runtime-3.1.16-win-x64.exe` |  dotnet-runtime source name 
`win_pdv_desktop_package_location` | no | `http://abtv55162.de.bosch.com:8084/doit-mirror/Microsoft/desktop_runtime/` |  Path to download windowsdesktop-runtime 
`win_pdv_desktop_package_file` | no | `windowsdesktop-runtime-6.0.6-win-x64.exe` |  windowsdesktop-runtime source name 
`win_pdv_dotnet_force_install` | no | `false` |  Force run install, skip pre-check step

Dependencies
------------

none.

Example Playbook
----------------

    - hosts: servers
      roles:
        - { role: had.win_pdv_dotnet, tags: ["win_pdv_dotnet","init"] }

Maintainer
------------------

XC-DA RADAR Continuous X (xcdaradarcontinuousx@bosch.com):
- Lam Trien Lap (MS/EDA22): Lap.LamTrien@vn.bosch.com
