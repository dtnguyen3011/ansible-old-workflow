# win_docker

This role installs a docker engine and docker-compose on a given Windows hosts using chocolatey.
Therefore the chocolatey collection to be installed first.

```bash
ansible-galaxy collection install chocolatey.chocolatey
```

**Important**: This role will trigger a restart during installation. This is required to activate the Windlows feature `containers`.

## Variables

Variable | Required  | Default | Description
-------- | --------- | ------- | -----------
`proxy_url` | No | `rb-proxy-de.bosch.com` | proxy url to use with chocolatey
`proxy_username` | No | `"{{ sysuser.name }}"` | proxy user to use with chocolatey
`proxy_password` | No | `"{{ sysuser.password }}"` | proxy password to use with chocolatey
