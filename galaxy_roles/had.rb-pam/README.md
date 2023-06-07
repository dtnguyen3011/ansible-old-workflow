# Role: rb-pam

This role is responsible for gathering secrets from RB-PAM.

### Overview on the role

The role:

* logon to RB-PAM (CyberArk) Rest API with Ansible URI module;
* collect secrets for `secret_names`;
* stores `secret_names` as ansible facts - `<<secret_names>>['password']` and `<<secret_names>>['username']`;
* logoff from RB-PAM;
* more information is available at [Docupedia](https://inside-docupedia.bosch.com/confluence/display/CCD/%5BPOC%5D+Solution+Desing+for+CyberArk-Ansible+integration)

### Configuration of the role

The role uses the following variables from files `vars/main.yml` and `defaults/main.yml`:

* `rbpam_url` - URL to RB-PAM portal;
* `safe_name` - name of the Safe;
* `project_name` - project name to which provisioned nodes belongs (it is provided as a reason for requesting access to specific secret);
* `secret_names` - list of the secrets to obtain from RB-PAM safe;
* `rbpam_user` - username to login to RB-PAM;
* `rbpam_password` - password to login to RB-PAM.

### safe_name variable

secret_names variable has limitations:

    Variable name must start with a letter or underscore character
    Must contain only letters, numbers and underscores
