# win_jenkins-master-add-node

This role adds a Windows based worker node to a defined jenkins master via the Jenkins `RESTful` api. This is a straight clone of the role `jenkins-master-add-node` with only `win_uri` calls.

Currently there are only `jnlp` based node connections supported.

## Usage

To use this role, provide the required information as listed in **Variables** to you playbook or inventory. Additionally, you need to have a user set up on Jenkins, that is able to do API calls. Preferably, a system user with only api and view privileges.

## Variables

Variable | Required | Default | Description
-------- | ---------| ------- | -----------
`jenkins_home` | Yes | - | Defined the home directory on the target host for the jenkins user. This variable might be used from the `jenkins-worker` role
`jenkins_master` | Yes | - | Dict containing all information for the Jenkins master the node needs to be connected to
`jenkins_master.url` | Yes | - | Url to the jenkins master
`jenkins_master.api_user` | Yes | - | ID of the user that is able to call the Jenkins RESTful API
`jenkins_master.api_key` | Yes | - | API key of `jenkins_master.api_user` | Yes | - | Please either use `vars_promt` or `ansible-vault` to provide this key.
`jenkins_win_worker` | Yes | - | Dict containing all information for the new windows jenkins node.
`jenkins_win_worker.description` | Yes | - | Description text for the node
`jenkins_win_worker.executors` | Yes | - | Number of executors on the node
`jenkins_win_worker.labels` | Yes | - | Space separated list of labels for the node. **Note:** Label `Windows` is always attached

### Example

```yml
jenkins_home: "D:\\Jenkins"
jenkins_master:
  url: "https://rb-jmaas.de.bosch.com/DOIT_CI"
  api_user: "some_user"
  api_key: "some_key"
jenkins_win_worker:
  description: "Some Description"
  executors: 2
  labels: "docker_build"
```
