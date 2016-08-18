# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.ssh.insert_key = false
  config.hostmanager.enabled = true

  config.vm.provider :virtualbox do |v|
    v.memory = 2048
    v.cpus = 2
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
  end

  config.vm.define "housing.dev" do |housing|
    housing.vm.hostname = "housing.dev"
    housing.vm.network :private_network, ip: "10.20.30.54"
    housing.vm.network "forwarded_port", guest: 3306, host: 3306
  end

  config.vm.define "oncampus.dev" do |oncampus|
    oncampus.vm.hostname = "oncampus.dev"
    oncampus.vm.network :private_network, ip: "10.20.30.55"
    oncampus.vm.network "forwarded_port", guest: 3306, host: 3307
  end

  config.vm.define "cucs.dev" do |cucs|
    cucs.vm.hostname = "cucs.dev"
    cucs.vm.network :private_network, ip: "10.20.30.56"
    cucs.vm.network "forwarded_port", guest: 3306, host: 3308
  end

  config.vm.define "bearcreek.dev" do |bearcreek|
    bearcreek.vm.hostname = "bearcreek.dev"
    bearcreek.vm.network :private_network, ip: "10.20.30.57"
    bearcreek.vm.network "forwarded_port", guest: 3306, host: 3309
  end

  config.vm.define "childcare.dev" do |childcare|
    childcare.vm.hostname = "childcare.dev"
    childcare.vm.network :private_network, ip: "10.20.30.59"
    childcare.vm.network "forwarded_port", guest: 3306, host: 3311
  end

  config.vm.define "pac12housing.dev" do |pac12housing|
    pac12housing.vm.hostname = "pac12housing.dev"
    pac12housing.vm.network :private_network, ip: "10.20.30.61"
    pac12housing.vm.network "forwarded_port", guest: 3306, host: 3313
  end

  config.vm.define "nrsmboulder.dev" do |nrsm|
    nrsm.vm.hostname = "nrsmboulder.dev"
    nrsm.vm.network :private_network, ip: "10.20.30.62"
    nrsm.vm.network "forwarded_port", guest: 3306, host: 3314
  end

  config.vm.define "nacurh2012.dev" do |nacurh|
    nacurh.vm.hostname = "nacurh2012.dev"
    nacurh.vm.network :private_network, ip: "10.20.30.65"
    nacurh.vm.network "forwarded_port", guest: 3306, host: 3315
  end

  config.vm.define "sandbox8.dev" do |sandbox8|
    sandbox8.vm.hostname = "sandbox8.dev"
    sandbox8.vm.network :private_network, ip: "10.20.30.63"
    sandbox8.vm.network "forwarded_port", guest: 3306, host: 3317
  end

  config.vm.define "sandbox7.dev" do |sandbox7|
    sandbox7.vm.hostname = "sandbox7.dev"
    sandbox7.vm.network :private_network, ip: "10.20.30.64"
    sandbox7.vm.network "forwarded_port", guest: 3306, host: 3318
  end

  config.vm.define "drupal7.dev" do |drupal7|
    drupal7.vm.hostname = "drupal7.dev"
    drupal7.vm.network :private_network, ip: "10.20.30.67"
    drupal7.vm.network "forwarded_port", guest: 3306, host: 3319
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
