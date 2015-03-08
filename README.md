vagrant-atlassian
=================

[![Gitter](https://badges.gitter.im/Join Chat.svg)](https://gitter.im/gmacario/vagrant-atlassian?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![PullReview stats](https://www.pullreview.com/github/gmacario/vagrant-atlassian/badges/master.svg?)](https://www.pullreview.com/github/gmacario/vagrant-atlassian/reviews/master)
[![Stories in Ready](https://badge.waffle.io/gmacario/vagrant-atlassian.png?label=ready&title=Ready)](https://waffle.io/gmacario/vagrant-atlassian)

[Vagrant](http://www.vagrantup.com/) project for testing the following [Atlassian](https://www.atlassian.com/) products:
* [Confluence](https://www.atlassian.com/software/confluence)
* [JIRA](https://www.atlassian.com/get-jira)

Copyright 2014-2015, [Gianpaolo Macario](http://gmacario.github.io/).

System Requirements
-------------------

* [Vagrant](http://www.vagrantup.com/) - tested with version 1.6.3
* One virtualization solution - tested with [VirtualBox](https://www.virtualbox.org/) 1.3.10
* One host OS supported by Vagrant - tested with [MS Windows 7 64-bit](http://windows.microsoft.com/)
* At least 4 GB RAM
* About 2 GB free disk space where the VM will run
* A fast Internet connection

Step-by-step instructions
-------------------------

Choose which Vagrant provider you are going to use.

In case the `--provider=docker` is selected later on, download the private SSH key to login to the phusion baseimage-docker:

```
curl -o phusion.key \
    https://raw.githubusercontent.com/phusion/baseimage-docker/master/image/insecure_key
```

Create the base VM with the following command

    $ vagrant up --provider=docker

If the Docker provider is not supported by your version of Vagrant you can omit the "--provider=docker" and use the default (Virtualbox) provider

    $ vagrant up

When the VM is up and running, login to the guest OS

    $ vagrant ssh

Logged into the guest VM (as user `vagrant` with the default Virtualbox provider or as `root` if "vagrant up --provider=docker" was used), you may install each Atlassian product independently.

### Install Confluence

    $ cd /vagrant

Verify the parameters at the beginning of the script `install-confluence.sh`, then launch the installer script

    $ ./install-confluence.sh

You may verify that Confluence is up and running by browsing the following URL from the guest OS:
[http://localhost:8090/](http://localhost:8090/)

### Install JIRA

    $ cd /vagrant

Verify the parameters at the beginning of the script `install-jira.sh`, then launch the installer script

    $ ./install-jira.sh

You may verify that JIRA is up and running by browsing the following URL from the guest OS:
[http://localhost:8080/](http://localhost:8080/)

<!-- EOF -->
