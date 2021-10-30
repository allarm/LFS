# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  # Adding a separate disk for the lfs partition
  config.vm.provider "virtualbox" do |vb|
      unless File.exist?(disk)
        vb.customize ['createhd', '--filename', disk, '--variant', 'Fixed', '--size', 30 * 1024]
      end
      vb.memory = "4096"
      vb.customize ['storageattach', :id,  '--storagectl', 'SATAController', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', disk]
    end

  config.vm.provision "checkup", type: "shell" do |s|
  config.vm.provision "Checkup...", type: "shell" do |s|
    s.path = "bin/00_check.sh"
  end

end
