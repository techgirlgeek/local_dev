# Ansible Vagrant profile for Drupal

## Background

Vagrant and VirtualBox (or some other VM provider) can be used to quickly build or rebuild virtual servers.

This Vagrant profile installs [Drupal](https://drupal.org/) using the [Ansible](http://www.ansible.com/) provisioner.

## Getting Started

This README file is inside a folder that contains a `Vagrantfile` (hereafter this folder shall be called the [vagrant_root]), which tells Vagrant how to set up your virtual machine in VirtualBox.

To use the vagrant file, you will need to have done the following:

  1. Download and Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
  2. Download and Install [Vagrant](https://www.vagrantup.com/downloads.html)
  3. Install [Ansible](http://docs.ansible.com/intro_installation.html)
  4. Open a shell prompt (Terminal app on a Mac)
      1.  Create a folder in your home director, ie: ~/Sites/dev. 
      2.  git clone git@bitbucket.org:hdscode/local_dev.git .
  5. vagrant up { site to build }
      1.  example: vagrant up oncampus.dev 
  6. Go grab some coffee while the magic happens.

Once the new VM is up and running (after `vagrant up` is complete and you're back at the command prompt), you can log into it via SSH if you'd like by typing in `vagrant ssh {site}`. Otherwise, the next steps are below.

### Setting up your hosts file

You need to modify your host machine's hosts file (Mac/Linux: `/etc/hosts`), adding the lines below:

    10.20.30.54   housing.dev
    10.20.30.55   oncampus.dev
    10.20.30.56   cucs.dev
    10.20.30.57   bearcreek.dev
    10.20.30.58   stampede.dev
    10.20.30.59   childcare.dev
    10.20.30.60   rha.dev
    10.20.30.61   pac12housing.dev
    10.20.30.62   nrsm.dev

After that is configured, you could visit http://site.dev/ (where site is whichever site you just installed) in a browser, and you'll see the Drupal site's home page.

If you'd like additional assistance editing your hosts file, please read [How do I modify my hosts file?](http://www.rackspace.com/knowledge_center/article/how-do-i-modify-my-hosts-file) from Rackspace.

## Author Information

Created in 2014 by [Jeff Geerling](http://jeffgeerling.com/), author of [Ansible for DevOps](http://ansiblefordevops.com/).

Edited, and modified, by Karyn Cassio, HDS IT, (techgirlgeek), 2016.
