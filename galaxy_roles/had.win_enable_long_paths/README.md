win_enable_long_paths
=========

This role will enable the long path support for windows.

Dependencies
------------

none.

Example Playbook
----------------

    - hosts: servers
      roles:
        - { role: had.win_enable_long_paths, tags: ["win_enable_long_paths", "init" ] }
