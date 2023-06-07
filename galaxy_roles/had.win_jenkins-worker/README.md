# win_jenkins-worker

This role deploys and installs a Windows based worker node.

**Caution**: This role requires to have the node registered first, e.g. by using the role `win_jenkins-master-add-node`.

Currently there are only `jnlp` based node connections supported.

## Usage

To use this role, provide the required information as listed in **Variables** to you playbook or inventory. Additionally, you need to have a user set up on Jenkins, that is able to do API calls. Preferably, a system user with only api and view privileges.

By design, the variable names for a base jenkins configuration, i.e. `jenkins_home` and `jenkins_master` are identical to those used in the roles `win_jenkins-master-add-node` and `win_jenkins-master-add-node`. This is to best possible reuse common settings and avoid overconfiguration.

This role takes advantage of `nssm`, the **N**on **S**ucking **S**ervice **M**anager, this allows an easy integration of the jnlp jar into the Windows service environment. To use this, please run the role `win_nssm` before. If `nssm` is not available, the service will not be installed and the slave must be started manually.

## Variables

Variable | Required | Default | Description
-------- | ---------| ------- | -----------
`jenkins_home` | Yes | - | Defined the home directory on the target host for the jenkins user. This variable might be used from the `jenkins-worker` role
`win_jenkins_service` | No | `omit` | Dict containing the user information for the `jnlp` windows service. If this option is omitted, the local user will be used to start the service. This however does not allow to mount any network shares. If shares are required, please specify a AD domain user (i.e. a system user) with access to the resources.
`win_jenkins_service.username` | Yes | - | User name with domain (i.e. `de\\userid` ) to start the service with.
`win_jenkins_service.password` | Yes | - | Password for `win_jenkins_nssm.username`.
`jenkins_master` | Yes | - | Dict containing all information for the Jenkins master the node needs to be connected to
`jenkins_master.url` | Yes | - | Url to the jenkins master
`jenkins_master.api_user` | Yes | - | ID of the user that is able to call the Jenkins RESTful API
`jenkins_master.api_key` | Yes | - | API key of `jenkins_master.api_user`. Please either use `vars_promt` or `ansible-vault` to provide this key.
`win_jenkins_install_dir` | No | `"C:\\\\tools\\\\Jenkins"` | Path to install all service and Jenkins runtime relevant files. Currently the `.bat` script for the service and the `agent.jar` itself.
`win_jenkins_service_name` | No | `"Jenkins_JNLP_worker"` | Name of the service to install. In case two Jenkins services are required.
`jenkins_nodename` | No | ansible_nodename | Name of the node to connect

### Example

```yml
jenkins_home: "D:\\Jenkins"
jenkins_master:
  url: "https://rb-jmaas.de.bosch.com/DOIT_CI"
  api_user: "some_user"
  api_key: "some_key"
win_jenkins_install_dir: "C:\\\\tools\\\\Jenkins"
win_jenkins_nssm:
  username: "de\\someuser"
  password: "secret_password"
```
