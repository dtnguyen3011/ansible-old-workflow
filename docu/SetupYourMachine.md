# Setup Your Machine for Ansible


## Prerequisits

A linux machine is required to execute ansible commands.
If Windows 10 is your OS, please use 'WSL' to run ansible

-----------------------

- [Setup Your Machine for Ansible](#setup-your-machine-for-ansible)
  - [Prerequisits](#prerequisits)
  - [<a name="HOST">Set up Machine as control node</a>](#set-up-machine-as-control-node)
    - [<a name="win10_host">Install ansible on win10</a>](#install-ansible-on-win10)
    - [<a name="Pywinrm">Install Pywinrm</a>](#install-pywinrm)
    - [<a name="Ansible">Install Ansible</a>](#install-ansible)
  - [<a name="Setting up machines for Ansible deployment (managed node)">managed_node</a>](#managed_node)
    - [<a name="Windows Server">winServ_host</a>](#winserv_host)
      - [Check WinRM availability on the machine](#check-winrm-availability-on-the-machine)
      - [Manual Setup of WinRM on the machine](#manual-setup-of-winrm-on-the-machine)
    - [<a name="Windows 10 (and Windows* Fallback)">win10_host</a>](#win10_host)

-----------------------
## <a name="HOST">Set up Machine as control node</a>
### <a name="win10_host">Install ansible on win10</a>
(more details can be found in this [wiki page](https://inside-docupedia.bosch.com/confluence/x/5_0lZQ)


1.install Px: copy px.exe and px.ini file into your local folder (C:/Px) more details can be found here: [https://inside-docupedia.bosch.com/confluence/x/ncgfUg](https://inside-docupedia.bosch.com/confluence/x/ncgfUg)

2.run following in cmd, and restarted your PC
```bash
px.exe --install
```

3.install WSL1 and Ubuntu 20.04 by following this wiki page: [https://inside-docupedia.bosch.com/confluence/x/HcF-K](https://inside-docupedia.bosch.com/confluence/x/HcF-K)

4.set proxy:
4.1 open ubuntu and edit proxy environment variables in .bashrc:
```bash
nano .bashrc
```
4.2 paste the following code in .bashrc
```bash
export http_proxy=http://127.0.0.1:3128/
export https_proxy=https://127.0.0.1:3128/
export socks_proxy=socks://127.0.0.1:3128/
export ftp_proxy=ftp://127.0.0.1:3128/
```
4.3 hint: paste using "strg + einfg" (german keybord) or "Ctrl + Insert" (english keybord)

4.4 save it and exist.
4.5 reload .bashrc so changes take effect immediately
```bash
source .bashrc (read the new update .bashhc and update it in the system)
```
4.6 Set proxy settings in the apt config
4.7 Add these lines to /etc/apt/apt.conf
```bash
Acquire::http::proxy "http://127.0.0.1:3128/";
Acquire::https::proxy "https://127.0.0.1:3128/";
```
4.8 add these variables in windows system variable:

    http_proxy: http://127.0.0.1:3128/
    https_proxy: https://127.0.0.1:3128/ 

4.9 restart the your pc.

### <a name="Pywinrm">Install Pywinrm</a>
Remark: This is only needed in case you want to manage windows machines with ansible

1. open ubuntu/wsl:

2. install python3 and python3-pip
```bash
sudo apt update
sudo apt install python3 python3-pip sshpass
``` 
```bash
pip3 --version
``` 
3.1 If you use the following command try to install ansible but failed
```bash
pip3 install ansible
```
for more info can be found [here](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-with-pip)
Hint: _sometimes you will get error and warning by calling this command, this is means you do not have permission to install the ansible in admin system_. So remove the "sudo" and try again.

3.2 intall pywinrm

You can use the command following instead. The command will install the pywinrm and ansible under your user name, when login with this user name to use ansible or pywinrm there should be no problem :
```bash
python3 -m pip install pywinrm
```

### <a name="Ansible">Install Ansible</a>

```bash
python3 -m pip install ansible
```

## <a name="Setting up machines for Ansible deployment (managed node)">managed_node</a>

### <a name="Windows Server">winServ_host</a>

Ansible for Windows requires the `WinRM` protocol to be enabled on the target host. Follow the [official guide](https://docs.ansible.com/ansible/latest/user_guide/windows_setup.html#winrm-setup) to setup WinRM.

Hint: _In some cases the ansible connection still fails inside the Bosch network even if the WinRM setup below was done correctly. A solution in such cases is to set `ansible_port: 5985` (http). This seems to help in cases where the default (https) port 5985 is not working._

#### Check WinRM availability on the machine

Windows servers in Bosch in general have WinRM already pre-configured by default. Servers (at least when ordered via the IT Service portal) therefore should work out of the box.

In case of problems check if the WinRM listener is active:

```powershell
winrm get winrm/config
```

When active, verify that the winrms connection with the user (needed administrative privileges) you want to connect with using  e.g. your system user:
_For CI managed cServers: the `Service User` specified when requesting the machine should have the required permissions._

```powershell
winrs -r:ServerName –u:Domain\Username –p:Password cmd.exe
```

If that worked, your windows server host is ready to be provisioned with ansible.

#### Manual Setup of WinRM on the machine

In cases the WinRM listener is not running you have to set it up manually.
To setup a host, log into the host and run the following command in a **privileged** powershell:

```powershell
$url = "http://abtv55162.de.bosch.com:8084/doit-mirror/WinRM/ConfigureRemotingForAnsible.ps1"
$file = "$env:temp\ConfigureRemotingForAnsible.ps1"

(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)

powershell.exe -ExecutionPolicy ByPass -File $file
```
### <a name="Windows 10 (and Windows* Fallback)">win10_host</a>

On many machines there is a GPO restriction active which blocks the setup of a WinRM listener. This (currently) is the case on Window 10 machines.
However there is an fallback solution available in cases where the configuration of WinRM is not possible. That solution uses openSSH to let ansible connect to the windows10 machines using ssh.

To setup a windows host for openSSH, log into the host and run the following command in a **privileged** powershell:

```powershell
$url = "http://abtv55162.de.bosch.com:8084/doit-mirror/SSH/ConfigureSSHForAnsible.ps1"
$file = "$env:temp\ConfigureSSHForAnsible.ps1"

(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)

powershell.exe -ExecutionPolicy ByPass -File $file
```

_ToDo: Figure out and document how to get connection using ssh-keys is working with windows. Currently only password authentication worked when testing. _

If you want to connect using ssh with username+password authentication you have to install sshpass on the machine you are running ansible on:
Afterwards you can set `ansible_password` in your ansible config and try to connect.

```bash
sudo apt install sshpass -y
```
