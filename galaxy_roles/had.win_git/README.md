# win-git

Role to insall git-scm on a Windows Server based machine.

Note:
The Upgrade functionality is currently not yet functioning and will be fixed in [release 2.10!](https://github.com/ansible/ansible/pull/66931).
For the upgrade to an ansible version higher than the one currently available via the Bosch package mirror (2.7.x) a proxy e.g. [Px Proxy!](https://inside-docupedia.bosch.com/confluence/x/DU1HJ) has to be installed and the [ansible ppa!](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) has to be added to your remote sources.

## Variables

Variable | Required  | Default | Description
-------- | --------- | ------- | -----------
`win_git_version` | No | `Git-2.20.1-64-bit.exe` | Full name of the git installer to be used. Important: If a older version is available, this will not be updated! Explicitly set the
`win_git_update` | No | false | Set true to enforce an upgrade of the installed git version. Note that git will be uninstalled and re-installed in the new version in the process! (Feature will require ansible 2.10+ to work properly!)
`win_git_add_private_key` | No | false | String representation of the private key that should be added for the user. Enabling will require additional parameters do be defined!
`win_git_user` | No (only if `win_git_add_private_key` is enabled) | -- | Object defining the user for whom the private key should be installed
`win_git_user.username` | No (only if `win_git_add_private_key` is enabled)  | -- | NT-User for whom the key should be added to the .ssh folder in it's home directory.
`win_git_user.sid` | No (only if `win_git_add_private_key` is enabled)  | -- | Only required if the target user has not logged into the machine before. Can be obtained via `wmic useraccount where name='<target_username>' get sid`. Recommended to be set to avoid failures on new machines!
`win_git_user.privkey` | No (only if `win_git_add_private_key` is enabled)  | -- | String representation of the content of the private key to be installed.
`win_git_user.pubkey` | No (only if `win_git_add_private_key` is enabled)  | -- | String representation of the content of the public key to be installed.
`win_git_lfs_install` | No | false | Flag to toogle if the additional git large file system extension should be installed on the system.
`win_git_cmd_dir` | No | `C:\Program Files\Git\cmd` | The installation path of git.exe
`win_git_user_fullname` | No | -- | Set to git user.name config if not empty
`win_git_user_email` | No | -- | Set to git user.email config if not empty

### Examples


```yml
win_git_version: "Git-2.27.0-64-bit.exe"
win_git_add_private_key: "true"
win_git_user:
  username: "esi9lr"
  sid: "S-1-5-21-220523388-115176313-1801674531-2339032"
  privkey: #Recommended to get from an ansible vault encrypted file or variable. (e.g. "{{lookup('file','<path_to_encrypted_file>')}}" )
win_git_lfs_install: "true"
```

## Available Versions

git                     |
----------------------- |
Git-2.19.1-64-bit.exe   |
Git-2.20.1-64-bit.exe   |
Git-2.25.0-64-bit.exe   |
Git-2.27.0-64-bit.exe   |
Git-2.35.1-64-bit.exe   |
