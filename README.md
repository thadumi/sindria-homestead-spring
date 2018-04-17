# sindria-homestead-spring

Laravel/Homestead custom configuration for Java Spring - Develop by Sindria Inc.: [https://sindria.org](https://sindria.org).

This configuration:

- oracle-jdk-8
- apache-tomcat-8.5.30
- maven 3.5.2


## Compatibility

FreeBSD, OSX, Archlinux, Fedora, Debian, Ubuntu and most other Gnu/Linux distribution. Probably also Windows.

## License
GPL V3 (See LICENSE).

## Issues

Issue reporting is welcome. Pull requests are welcome.

## Full Installation
#### Make sure you have installed the following package: ####

- Virtualbox 5.1 or higher ( dkms, kernel-devel-uname-r == $(uname -r) )
- Vagrant 1.9 or higher
- Git
- OpenSSH client
- Vim

#### Before doing the git clone: ####

##### Add vagrant box #####
$ `vagrant box add laravel/homestead`

$ `vagrant plugin install vagrant-vbguest`

$ `vagrant plugin install vagrant-hostmanager`

##### Edit your hosts file #####
$ `sudo vim /etc/hosts`

`10.249.197.10   <app-name> ## Homestead Host - add by Sindria Inc.`

##### Generate ssh-key #####
$ `mkdir ~/.ssh/homestead/`

$ `cd ~/.ssh/homestead/`

$ `ssh-keygen`: enter the id_rsa name `vagrant@<app-name>` with no passphrase. (enter twice)

##### Make project directory and clone this repo #####
$ `mkdir ~/<my-projects-folder>/`

$ `cd ~/<my-projects-folder>/`

$ `git clone https://github.com/SindriaInc/sindria-homestead-spring.git`

$ `mv sindria-homestead-spring <app-name>`

$ `cd ~/<my-projects-folder>/<app-name>`

$ `rm -rf .git/`

##### Edit Homestead.yaml #####
$ `vim Homestead.yaml`

##### Start vagrant box and provisioning for the first start #####
$ `vagrant up`

##### Fix tomcat permission with simple scripts #####
$ `vagrant ssh`

$ `sudo -i`

$ `cd /opt/tomcat/webapps/source_<app-name>`

$ `chmod +x fixer-tomcat-permission.sh`

$ `./fixer-tomcat-permission.sh` and insert your <app-name> when asked.


##### Go to browser at http://app-name:8080 or http://my-ip-address:8080 #####

###### Mysql credentials: ######

Database - homestead

DB_User - homestead

DB_Pass - secret

DB_User - root

DB_Pass - secret

###### Tomcat credentials: ######

username - admin

password - admin

_________________________________________________________________________________________________


## New Instance

##### Edit your hosts file #####
$ `sudo vim /etc/hosts`

`10.249.197.10   <app-name> ## Homestead Host - add by Sindria Inc.`

##### Generate ssh-key #####
$ `cd ~/.ssh/homestead/`

$ `ssh-keygen`: enter the id_rsa name `vagrant@<app-name>` with no passphrase. (enter twice)

##### Clone this repo #####
$ `cd ~/<my-projects-folder>/`

$ `git clone https://github.com/SindriaInc/sindria-homestead-spring.git`

$ `mv sindria-homestead-spring <app-name>`

$ `cd ~/<my-projects-folder>/<app-name>`

$ `rm -rf .git/`

##### Edit Homestead.yaml #####
$ `vim Homestead.yaml`

##### Start vagrant box and provisioning for the first start #####
$ `vagrant up`

##### Fix tomcat permission with simple scripts #####
$ `vagrant ssh`

$ `sudo -i`

$ `cd /opt/tomcat/webapps/source_<app-name>`

$ `chmod +x fixer-tomcat-permission.sh`

$ `./fixer-tomcat-permission.sh` and insert your <app-name> when asked.
	

##### Go to browser at http://app-name:8080 or http://my-ip-address:8080 #####

###### Mysql credentials: ######

Database - homestead

DB_User - homestead

DB_Pass - secret

DB_User - root

DB_Pass - secret

###### Tomcat credentials: ######

username - admin

password - admin









