# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  #config.vm.box = "geerlingguy/ubuntu1404"
  config.vm.box = "ubuntu/trusty64"
  config.ssh.insert_key = false
  config.hostmanager.enabled = true

  config.vm.provider :virtualbox do |v|
    v.name = "hdsvm"
    v.memory = 1024
    v.cpus = 2
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
  end

  config.vm.hostname = "hdsvm"
  config.vm.network :private_network, ip: "192.168.36.3"

  # Set the name of the VM. See: http://stackoverflow.com/a/17864388/100134
  config.vm.define :hdsvm do |hdsvm|
  end

  config.vm.provider :virtualbox do |v|
    v.name = "housing.dev"
    v.memory = 1024
    v.cpus = 2
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
  end

  config.vm.hostname = "housing.dev"
  config.vm.network :private_network, ip: "192.168.36.5"

  config.vm.define "housing.dev" do |housing|
  end

  # Ansible provisioner.
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/playbook.yml"
    ansible.inventory_path = "provisioning/inventory"
    ansible.sudo = true
    #ansible.verbose = "vv"
  end

end
