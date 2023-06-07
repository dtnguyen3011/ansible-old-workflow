win_telegraf
=========

Check/Install/Remove Telegraf service  for windows.

Requirements
------------

none.

Role Variables
--------------

Variable | Required | Default | Description
-------- | -------- | ------- | -----------
`win_telegraf_package_version` | no | `telegraf-1.18.2` |  Version of package for using
`win_telegraf_action_flag` | no | `check` |  Flag to sepecify action will be done (check/install/update/delete)

Dependencies
------------

none.

Example Playbook
----------------

```yml
win_telegraf:
  influxdb_urls: ["http://url.local.com:1234/"]
  influxdb_database: db_name
win_telegraf_action_flag: "update"
```

```yml
    - hosts: servers_for_check_only
      roles:
        - { role: had.win_telegraf, tags: ["win_telegraf","init"] }
```

```yml
    - hosts: servers_for_install
      roles:
        - { role: had.win_telegraf, tags: ["win_telegraf","init"], win_telegraf_action_flag: install}
```

```yml
    - hosts: servers_for_force_update
      roles:
        - { role: had.win_telegraf, tags: ["win_telegraf","init"], win_telegraf_action_flag: update}
```

```yml
    - hosts: servers_for_delete
      roles:
        - { role: had.win_telegraf, tags: ["win_telegraf","init"], win_telegraf_action_flag: delete}
```


Maintainer
------------------

XC-DA RADAR Continuous X (xcdaradarcontinuousx@bosch.com):
- Lam Trien Lap (MS/EDA15): Lap.LamTrien@vn.bosch.com
