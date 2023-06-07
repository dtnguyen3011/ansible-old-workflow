win_perl_tcc
=========

Installation of perl for windows via TCC.
This is only used for Radar_Measurement team.

Requirements
------------

none.

Role Variables
--------------

Variable | Required | Default | Description
-------- | -------- | ------- | -----------

Dependencies
------------

none.

Example Playbook
----------------

    - hosts: servers
      roles:
        - { role: win_perl_tcc, tags: ["win_perl_tcc","init"] }

Maintainer
------------------

XC-DA RADAR Continuous X (xcdaradarcontinuousx@bosch.com):
- LAM TRIEN LAP (MS/EDA15): Lap.LamTrien@vn.bosch.com