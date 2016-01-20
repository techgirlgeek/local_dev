# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  #config.vm.box = "geerlingguy/ubuntu1404"
  config.vm.box = "ubuntu/trusty64"
  config.ssh.insert_key = false
  config.hostmanager.enabled = true

  config.vm.provider :virtualbox do |v|
    v.memory = 1024
    v.cpus = 2
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
  end

  config.vm.define "housing.dev" do |housing|
    housing.vm.hostname = "housing.dev"
    housing.vm.network :private_network, ip: "10.20.30.54"
  end

  config.vm.define "oncampus.dev" do |oncampus|
    oncampus.vm.hostname = "oncampus.dev"
    oncampus.vm.network :private_network, ip: "10.20.30.55"
  end

  config.vm.define "cucs.dev" do |cucs|
    cucs.vm.hostname = "cucs.dev"
    cucs.vm.network :private_network, ip: "10.20.30.56"
  end

  config.vm.define "bearcreek.dev" do |bearcreek|
    bearcreek.vm.hostname = "bearcreek.dev"
    bearcreek.vm.network :private_network, ip: "10.20.30.57"
  end

  config.vm.define "stampede.dev" do |stampede|
    stampede.vm.hostname = "stampede.dev"
    stampede.vm.network :private_network, ip: "10.20.30.58"
  end

  config.vm.define "childcare.dev" do |childcare|
    childcare.vm.hostname = "childcare.dev"
    childcare.vm.network :private_network, ip: "10.20.30.59"
  end

  config.vm.define "rha.dev" do |rha|
    rha.vm.hostname = "rha.dev"
    rha.vm.network :private_network, ip: "10.20.30.60"
  end

  config.vm.define "pac12housing.dev" do |pac12housing|
    pac12housing.vm.hostname = "pac12housing.dev"
    pac12housing.vm.network :private_network, ip: "10.20.30.61"
  end

  config.vm.define "nrsm.dev" do |nrsm|
    nrsm.vm.hostname = "nrsm.dev"
    nrsm.vm.network :private_network, ip: "10.20.30.62"
  end

  # Ansible provisioner.
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/playbook.yml"
    ansible.inventory_path = "provisioning/inventory"
    ansible.sudo = true
    #ansible.verbose = "vv"
  end

end
