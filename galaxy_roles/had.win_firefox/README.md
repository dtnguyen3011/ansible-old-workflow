win_firefox
=========

Installation of firefox for windows.

Requirements
------------

none.

Role Variables
--------------

Variable | Required | Default | Description
-------- | -------- | ------- | -----------
`win_firefox_pid` | no | `Mozilla Firefox 84.0.2 (x64 de)` | Product id related to the installation

Dependencies
------------

none.

Example Playbook
----------------

    - hosts: servers
      roles:
        - { role: win_firefox, tags: ["win_firefox","init"] }

Maintainer
------------------

NRC2 Automation Team (ccdanrcs2automationscrumteam@bosch.com):
- Klich Marc (CC-AD/ESW2): Marc.Klich@de.bosch.com
- Bartmann Sebastian (CC-DA/EPA3): Sebastian.Bartmann@de.bosch.com
- Cieslar Matthias (CC-DA/EPA2): Matthias.Cieslar@de.bosch.com