# Ansible Vagrant profile for HDS Drupal Installs

## Background

Vagrant and VirtualBox (or some other VM provider) can be used to quickly build or rebuild virtual servers.

This Vagrant profile installs [Drupal](https://drupal.org/) using the [Ansible](http://www.ansible.com/) provisioner.

## Getting Started

This README file is inside a folder that contains a `Vagrantfile` (hereafter this folder shall be called the [vagrant_root]), which tells Vagrant how to set up your virtual machine in VirtualBox.

To use the Vagrantfile, you will need to do the following:

### Setting up your environment

  1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
  2. Install [Vagrant](https://www.vagrantup.com/downloads.html)
  3. Install [Ansible](http://docs.ansible.com/ansible/intro_installation.html#latest-releases-on-mac-osx)
    1. After installing pip, and ready to install ansible, do: sudo pip install ansible==1.9.4
    2. Unfortunately the new 2.0 version, currently in release, doesn't work with prompts.

### Building Your VM(s)
  
  1. In iTerm (or other terminal client) change directory to where ever you keep your local sites, ie: /Users/username/Sites
    2. If you don't have a sub-directory, Sites in your home directory, create it.
    3. Clone the local_dev repo: `git clone git@bitbucket.org:hdscode/local_dev.git`
      1. Change directory into local_dev: `cd local_dev`
    4. Make sure vagrant hostmanager is installed by running: `vagrant plugin list`
      1. If hostmanager was not in the plugin list, install 
      2. To install hostmanager: `vagrant plugin install vagrant-hostmanager`
  5. Make sure you are ***connected to the Big-IP Edge VPN client***.
    1. In case you forgot to log into the VPN the build will pause for 60 seconds during the **Waiting for VPN** task.
  6. To see a list of all sites ready to build, do a vagrant status: vagrant status
  7. vagrant up { site to build }
    1.  example: `vagrant up oncampus.dev` 
  8. Sit back, relax, and *watch* the magic happens.
    1. If your vagrant up fails, or you want to refresh any of your installs, do the following:
    2. `vagrant provision site.dev`

Once the new VM is up and running (after `vagrant up` is complete and you're back at the command prompt), you can log into it via SSH if you'd like by typing in `vagrant ssh {site.dev}`.

### Sandbox Installs

If you installed one of the sandboxes (sandbox8.dev or sandbox7.dev):

  1. If you can't get to the site in your browser, ssh into the box and run: sudo apachectl graceful
  2. To access the site:
    1. Username: admin
    2. Password: admin
  1. The sandboxes are built from GIT. If you want to know more about getting on the most up-to-date branch, etc, checkout: https://www.drupal.org/node/803746

### Getting bundle exec to work

  1. After you install a new VM, to get bundle exec guard working, do the following:
    1. Inside your VM navigate to your theme directory.
    2. Type the alias: guard
    3. Guard should be fired up and ready to go.

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
    10.20.30.62   nrsmboulder.dev
    10.20.30.65   nacurh2012.dev
    10.20.30.63   sandbox8.dev
    10.20.30.64   sandbox7.dev

After that is configured, you could visit http://site.dev/ (where site is whichever site you just installed) in a browser, and you'll see the Drupal site's home page.

If you'd like additional assistance editing your hosts file, please read [How do I modify my hosts file?](http://www.rackspace.com/knowledge_center/article/how-do-i-modify-my-hosts-file) from Rackspace.

### Post Install Vagrant Commands
*Where ever your see vm_name.dev, substitute the VM you are working on, ie: oncampus.dev*

1. To check which VM's are up, built, not built, etc: `vagrant status`
2. To check the status of a specific VM to the above, with the name of the VM you are interested in. For example: `vagrant status vm_name.dev`
3. To shut down a VM you are not working on currently (you shouldn't ever have all the VM's running at once, it will bring your computer to a halt.): `vagrant halt vm_name.dev`
3. To destroy a VM and start again do: `vagrant destroy vm_name.dev`.
4. To update the vagrant box version: `vagrant box update vm_name.dev`.

## Author Information

*Originally created in 2014 by [Jeff Geerling](http://jeffgeerling.com/), author of [Ansible for DevOps](http://ansiblefordevops.com/).*

*Edited, and modified, by Karyn Cassio ([techgirlgeek](http://techgirlgeek.com/)), Drupal Software Engineer, HDS IT, 2016.*