# win_java

Install Java 64bit for Windows Server based hosts

## Variables

All variables are contained in the `win_java` structure

Variable | Required  | Default | Description
-------- | --------- | ------- | -----------
`win_java` | Yes | - | Dict containing all install settings
`win_java_install_path` | No | `C:\\Program Files\\Java\\jre1.8.0` | Path for installation. Caution changing this might break auto deinstall of old jres.
`win_java.jtype` | No | `jre` | type `open-jdk` used for Radar5 with LUCXBAU ver 22 above
`win_java.jversion` | No | `jre8` | JRE version to install `jversion` to keep consistency with `jupdate`
`win_java.jupdate` | Yes | - | Java update version to install (recommended always latest!) `update` is a reserved keyword, there `jupdate`
`win_java_force_install` | no | `false` |  Force run install, skip pre-check step

### Example

See the following example as a reference of how to define the variables

```yaml
win_java:
  jtype: jre
  jversion: jre8
  jupdate: 8u201
win_java_install_path: "C:\\Program Files\\Java\\jre1.8.0"
```
Or open-jdk
```yaml
win_java:
  jtype: open-jdk
  jversion: 1.8.0.275
  jupdate: java-1.8.0-openjdk-1.8.0.275-1.b01.redhat.windows.x86_64.msi
win_java_install_dir: "C:\\Program Files\\RedHat\\java-1.8.0-openjdk-1.8.0.275-1"
```

## java installer cfg

The jre installer is called using a `cfg` file (for more information see [here](https://docs.oracle.com/javase/8/docs/technotes/guides/install/config.html#table_config_file_options)). The following configuration are applied:

Configuration | Value | Description
------------- | ----- | -----------
`INSTALL_SILENT` | `Enable` | Do a silent install
`INSTALLDIR` | `{{ win_java_install_dir }}` | Defined installation directory. Either default or user defined
`AUTO_UPDATE` | `Disable` | Disable auto install of updates. On servers without proxy not possible anyways
`WEB_JAVA` |  `Disable` | Do not allow browser based java applications
`WEB_JAVA_SECURITY_LEVEL` | `VH` | Technially not needed but set to highest setting
`WEB_ANALYTICS`  | `Disable` | Disable send back of analytic information.
`REBOOT` | `Disable` | Do not reboot after insallation
