# jenkins-master-add-worker

This role add a linux based worker node to a defined jenkins master via the Jenkins `RESTful` api.

Currently there are only `ssh` based node connections supported.

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
`jenkins_master.ssh_credentialsId` | Yes | - | Jenkins `credendialsID` of the User added to the jenkins master that is used to establish a ssh connection
`jenkins_worker` | Yes | - | Dict containing all information for the new jenkins node.
`jenkins_worker.description` | Yes | - | Description text for the node
`jenkins_worker.executors` | Yes | - | Number of executors on the node
`jenkins_worker.labels` | Yes | - | Space separated list of labels for the node

### Example

```yml
jenkins_home: "/var/jenkins"
jenkins_master:
  url: "https://rb-jmaas.de.bosch.com/DOIT_CI"
  api_user: "some_user"
  api_key: "some_key"
  ssh_credentialsId: "e2cdaa2a-d38b-4786-866d-f709cdcdb1fc"
jenkins_worker:
  description: "Some Description"
  executors: 2
  labels: "docker_build"
```

## Jenkins requirements

To allow jenkins establishing a SSH connection to the agent, following plugins need to be installed
 - SSH Agent
 - SSH Build Agents
