# docker-compose

Install docker compose on any linux based target.

## Variables

Variable | Required | Default | Description
-------- | -------- | ------- | -----------
`compose_version` | yes | - | Version of `docker-compose` to install. Currently only `1.24.1` is supported

### Example

```yml
vars:
    compose_version: '1.24.1'
```
