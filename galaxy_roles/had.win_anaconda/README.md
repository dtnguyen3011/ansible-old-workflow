# win_anaconda

This role installs the Anaconda python environment.
It also copies the `.condarc` file and run the `conda update` command.
It is also possible to set a list of packages with and without an specific channel.

For more information of the tool itself, see the [official documentation](https://docs.anaconda.com/)

If anaconda is installed, all old possible packages (as supported by this role) will be removed first

## Variables

All variables are marked with the prefix `win_anaconda_`

Variable | Required  | Default | Description
-------- | --------- | ------- | -----------
`win_anaconda_version` | No | `3.7-2019.03` | Version of anaconda (Python + Anaconda release) to install.
`win_anaconda_install_dir` | No | `C:\\tools\\anaconda` | Install directory for Anaconda.
`win_anaconda_packages` | No | `Null` | Packages to be installed. Example: "pandas numpy lxml numexpr"
`win_anaconda_channel_packages` | No | `Null` | Array with packages to be installed with specified channels
`win_anaconda_update_packages` | No | `true` | If set to `true` only update and install new packages.
`win_anaconda_do_install` | No | `false` | If set to `true` install Anaconda


To enable the switch `win_anaconda_do_install` without changing you inventory / group_vars, you can overwrite this variable during the cli call.
Simply attach `--extra-vars "win_anaconda_do_install=true"` as an extra argument to your `ansible-playbook` call.

### Example

```yml

win_anaconda_version: "3.7-2019.03"
win_anaconda_install_dir: "C:\\tools\\anaconda"
win_anaconda_update_packages: true
win_anaconda_do_install: false

win_anaconda_packages: "pandas numpy lxml numexpr pathlib"
win_anaconda_channel_packages:
  - { channel: "conda-forge",
      packages: "asammdf" }
```

## Available versions

The following versions are supported:

Version | `win_anaconda_version` Name | Python Version
--------| --------------------------- | --------------
2019.03 | `3.7-2019.03`               | `3.7.3`
2019.10 | `3.7-2019.10`               | `3.7.4`

## Privileges

The Anaconda user must have the permission: "Allow Logon as a Batch Job" in the target host computer.
