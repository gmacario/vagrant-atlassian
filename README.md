vagrant-atlassian
=================

Vagrant project for testing the following [Atlassian](https://www.atlassian.com/) products:
* [Confluence](https://www.atlassian.com/software/confluence)
* [JIRA](https://www.atlassian.com/get-jira)

System Requirements
-------------------

* [Vagrant](http://www.vagrantup.com/) - tested with Vagrant 1.6.3

Step-by-step instructions
-------------------------

Create the base VM with the following command:

    $ vagrant up
    
When the VM is up and running, login to the guest OS

    $ vagrant ssh
    
Logged in as user `vagrant`, you may install each Atlassian product independently

## Install Confluence

    $ cd /vagrant
    
Verify the parameters at the beginning of the script `install-confluence.sh`, then launch the installer script

    $ ./install-confluence.sh
    
You may verify that Confluence is up and running by browsing the following URL from the guest OS: http://localhost:8090/

## Install JIRA

    $ cd /vagrant

Verify the parameters at the beginning of the script `install-jira.sh`, then launch the installer script

    $ ./install-jira.sh

You may verify that JIRA is up and running by browsing the following URL from the guest OS: http://localhost:8080/

Copyright 2014, [Gianpaolo Macario](http://gmacario.github.io/)
