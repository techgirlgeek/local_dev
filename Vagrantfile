# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  #config.vm.box = "bento/ubuntu-16.04"
  config.ssh.insert_key = false
  config.hostmanager.enabled = true

  config.vm.provider :virtualbox do |v|
    v.memory = 2048
    v.cpus = 2
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
  end

  config.vm.define "client.dev" do |client|
    client.vm.hostname = "client.dev"
    client.vm.network :private_network, ip: "10.20.30.54"
    client.vm.network "forwarded_port", guest: 3306, host: 3306
  end

  config.vm.define "drupal7.dev" do |drupal7|
    drupal7.vm.hostname = "drupal7.dev"
    drupal7.vm.network :private_network, ip: "10.20.30.67"
    drupal7.vm.network "forwarded_port", guest: 3306, host: 3319
    drupal7.vm.synced_folder "/Users/karyncassio/Sites/davita","/var/www/web/davita-careers/",:nfs => true
    drupal7.vm.synced_folder "/Users/karyncassio/Sites/davita-referrals","/var/www/web/davita-referrals/",:nfs => true
  end

  config.vm.define "dia.dev" do |dia|
    dia.vm.hostname = "dia.dev"
    dia.vm.network :private_network, ip: "10.20.30.69"
    dia.vm.network "forwarded_port", guest: 3306, host: 3321
    dia.vm.synced_folder "/Users/karyncassio/Sites/dia","/var/www/dia.dev/public",:nfs => true
  end

  config.vm.define "drupal8.dev" do |drupal8|
    drupal8.vm.hostname = "drupal8.dev"
    drupal8.vm.network :private_network, ip: "10.20.30.68"
    drupal8.vm.network "forwarded_port", guest: 3306, host: 3320
  end

  # Ansible provisioner.
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/playbook.yml"
    ansible.inventory_path = "provisioning/inventory"
    #ansible.verbose = "vvvv"
    #ansible.tags = "dbrefresh"
  end

end
