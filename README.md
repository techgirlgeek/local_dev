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
      1.  Change directory to where ever you keep your local sites, ie: ~/Sites
      2.  git clone git@bitbucket.org:hdscode/local_dev.git
  5. vagrant up { site to build }
      1.  example: vagrant up oncampus.dev 
  6. If it gets stuck while on step "Check out Repo to the specified location." 
      1. To test if it is stuck, do the following:
        1.  Open a new terminal window
        2.  Change directory to where you cloned the repo: ~/Sites/local_dev
        3.  vagrant ssh { site }
        4.  Change directory to the site on vagrant: cd /var/www/web/site
        5.  List the contents of that directory (ls). If you see public, it's still working on it.
      2. If you don't see public, do the following:
        1.  Ctrl-C
        2.  vagrant provision { site working on }
        3.  example: vagrant provision housing.dev
  6. Sit back, relax, and watch the magic happens.

Once the new VM is up and running (after `vagrant up` is complete and you're back at the command prompt), you can log into it via SSH if you'd like by typing in `vagrant ssh {site}`.

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

### Oncampus.dev special instructions

For now, you will need to do the following before you log into your site on the browser:

  1. vagrant ssh oncampus.dev
  2. cd to oncampus/sites/all/modules/custom
  3. git clone git@bitbucket.org:hdscode/myroom.git

If you'd like additional assistance editing your hosts file, please read [How do I modify my hosts file?](http://www.rackspace.com/knowledge_center/article/how-do-i-modify-my-hosts-file) from Rackspace.

## Author Information

Created in 2014 by [Jeff Geerling](http://jeffgeerling.com/), author of [Ansible for DevOps](http://ansiblefordevops.com/).

Edited, and modified, by Karyn Cassio ([techgirlgeek](http://techgirlgeek.com/)), Drupal Software Engineer, HDS IT, 2016.
