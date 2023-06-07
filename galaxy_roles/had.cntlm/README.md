# Role: cntlm
Installs the cntlm proxy if not present and configures it with the provider user & password.

Installed software:
- cntlm

NEEDS REFACTORING:
- Rename variables to a better schema.


## Requirements
- variables:
	- nt_user: proxy user
	- nt_user_pw: proxy user password
	- domain: proxy user domain