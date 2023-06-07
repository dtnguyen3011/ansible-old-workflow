# Role Docker Community Edition (CE)

Installs docker on either a Ubuntu or a CentOS system.
Docker is deployed via package based `.deb` or `.rpm` install.

## What it does

This role checks if docker-ce was installed before and **always** triggers an uninstall of potential installed docker software.
In detail this is:
* docker
* docker-client
* docker-ce
* docker-ce-cli
* docker-client-latest
* docker-common
* docker-latest
* docker-latest-logrotate
* docker-logrotate
* docker-engine

It additionally installs some required packages. For CentOS: `ca-certificates` and `yum-utils`, for Ubuntu: `apt-transport-https` and `ca-certificates`.

Docker will be installed with `containerd-io` and `docker-ce-cli`.
The packages will be installed via a offline package based installation.

## Variables

All variables are marked with the prefix `win_ramdisk`

Variable | Required  | Default | Description
-------- | --------- | ------- | -----------
`docker_engine_type` | No | `ce` | Type of the used docker engine. Either `ce` for Comunity-Edition or `ee` for Enterprise-Edition supported
`docker_version` | No | `19.05.3` |  Defines the version of docker to install. With the latest version, this includes both `docker-ce` and `docker-ce-cli`
`containerdio_version`| No | `1.2.10` | Defines the version of cotainerd-io to install. **This version must be compatible with `docker-ce` and `docker-ce-cli`
`default_docker_config` | No | See example | yaml representation of the desired `daemon.json`.
`docker_http_proxy` | No |  | Defines a proxy settings to docker daemon for http requests.
`docker_https_proxy` | No |  | Defines a proxy settings to docker daemon for https requests.
`docker_no_proxy` | No |  | Defines a list that contains comma-separated values for hosts that should be excluded from proxying. See examples.
### Example

```yaml
upgrade_docker: true
default_docker_config:
  storage-driver: overlay2
  storage-opts:
    - "overlay2.override_kernel_check=true"
  log-level: info
  log-driver: json-file
  log-opts:
    max-size: "100m"
    max-file: "3"

docker_engine_type: ce
docker_version: "19.03.5"
containerdio_version: "1.2.10"
docker_http_proxy: "http://127.0.0.1:3128"
docker_https_proxy: "http://127.0.0.1:3128"
docker_no_proxy:
  - "localhost"
  - "127.0.0.*"
  - "10.*"
  - "192.168.*"
  - "*.bosch.com"
  - "172.17.0.*"
```

## Available Versions

docker-ce | docker-ee | containerd-io
--------- | --------- | -------------
17.12.1   |     -     |      -
18.09.9   |     -     |  1.2.6
19.03.5	  |  19.03.4  |  1.2.10
19.03.13  |     -     |  1.3.7

## Package naming policy

To ensure availability of new packages, the following naming policy must be used on the package mirror:

```txt
<package name>-<version>_<architecture>.<package type>
```

E.g. for CentOS:

```txt
docker-ce-19.03.5_x86_64.rpm
```