win_canoe
=========

Install CANoe

Requirements
------------

none.

Role Variables
--------------

Variable | Required  | Default | Description
-------- | --------- | ------- | -----------
`canoe_temp_dir` | Yes | `C:\temp\win_canoe_install` | Path for CANoe temporary download folder
`canoe_package_location` | Yes | `http://abtv55162.de.bosch.com:8084/doit-mirror/CANoe/CANoe_{{ canoe_version }}_64bit.zip` | CANoe package location
`canoe_driver_setup_location` | Yes | `https://download.vector.com/drivers/Vector_Driver_Setup.zip` | CANoe Driver setup download location
`product_id_CANoe_V12_SP2` | Yes | `3558186A-ACCC-4ACE-A03C-369ACF4D0D35` | CANoe product ID for version 12.0 SP2
`product_id_CANoe_V11_SP3` | Yes | `9E607810-015E-43EE-92A8-4C1F266E1805` | CANoe product ID for version 11.0 SP3
`canoe_version` | Yes | `V11.0_SP3` | CANoe default version
`canoe_msi_paths_prefix` | Yes | `{{ canoe_temp_dir }}\\CANoe_{{ canoe_version }}_64bit\\Master_CANoe_64bit\\CANoe\\Files\\` | CANoe default path for msi files
`drivers_installation_list` | Yes | `VN7610 VN5610A dongle` | List of drivers to install

Dependencies
------------

none.

Example Playbook
----------------

    - hosts: servers
      roles:
        - { role: win_canoe, tags: ["win_canoe","init"] }

Maintainer
------------------

- Zanger Florian (CC-AD/ETV1) <Florian.Zanger@de.bosch.com>
- Tedeschi Karl (CC-AD/ETV1) <KarlJosef.Tedeschi@de.bosch.com>