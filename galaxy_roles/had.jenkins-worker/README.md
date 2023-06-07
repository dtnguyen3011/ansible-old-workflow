# Role: Jenkins Worker

Prepares the system to be used by a Jenkins Master as a SSH Slave.

It installs the `openssh-server`, creates a `jenkins` user, and adds a public key (defined via `jenkins_public_key`) to the `authorized_keys` file.

Installed software:

- openssh-server

## Variables

| Variable             | Required | Default     | Description                                                                                                                                                                |
| -------------------- | -------- | ----------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `jenkins_home`       | No       | `omit`      | Home directory of the jenkins user. If not given, the system defaults, e.g. `/home/$USER/` will be used                                                                    |
| `jenkins_user_shell` | No       | `/bin/bash` | Default shell for the jenkins user to start with                                                                                                                           |
| `jenkins_uid`        | No       | `omit`      | UID for the Jenkins user. If not given, the system defaults will be used. This can be useful if the worker runs a docker engine and needs to pass files to the containers. |
| `ssh_service`        | No       | `ssh`       | The name of the ssh-service for the machine                                                                                                                                |
| `jenkins_public_key` | Yes      | -           | The public key for the connecting jenkins master server. This key is used to establish an ssh connection.                                                                  |

### Example

```yaml
jenkins_home: "/var/jenkins"
jenkins_user_shell: "/bin/bash"
jenkins_uid: 10000
jenkins_public_key: "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDXLn43y2saM31FjIiXuNsWEKlNjku86Zr/PLNpBKyTVJCN+FREDWTj17o2V2OY9i9evqqy9U56bjk+t5qOK3/Xld8UV3FykRBv9Bb+B1WgCrboA1gcYE/ZVO+aNxwRbvfv+myn2u822LVoUysrFYx+oWlvmEQ4XnZ+BNE4DgiflBqZNEGIuE4nd4BuI7UOLLzHSt8cBJG19R2deqenEJ+jU6zPp72aAJc/M/y3cbQOFFmpkmvCJvbYmhTD1eDZotmSIGoBY+rCZ7lpsrnI3BkgxJKn8UlfisJja6m88ebQvplWu7HkkFa8N8i96Lx8AXGSQ1o3vbjhnyEqvVvSHWVTtywmQb+OMq+p7hvnE3u8PsVdA0PlXP1QRIVbZXWeok//uxcQDtHLC+KE93MLj2eYXaWVBABAjXmb1nfsWQFr5FfG3ro3H/n1ySxh/1/bJjzuQetW51mrmSCuarA332PAakMMysatzP4ABln8fvkdRBwDNVZ0Sg988xTrzc77JHn05Hasxow2mwFnxmfg1SlE9BcVvgVpLlcHYhFBYL/9J59BdZ/WyMIHEWkKNXeAQHMf2qlfFT3YGfbO41en9nhaS638zKR4TjGJzOGuo6w0bBYydTbHoHpylYobZTE2rz4PvpaSNQpnLyxhDhY/b4nFQag2sC6dvSzUA4luAygJVQ== rth3fe@ABTZ0KON"
```

## Requirements

- dependencies:
  - java
