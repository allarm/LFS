# -*- mode: ruby -*-
# vi: set ft=ruby :

disk = './lfs.vdi'

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "lfs"

  # Adding a separate disk for the lfs partition
  config.vm.provider "virtualbox" do |vb|
      unless File.exist?(disk)
        vb.customize ['createhd', '--filename', disk, '--variant', 'Fixed', '--size', 30 * 1024]
      end
      vb.memory = "4096"
      vb.customize ['storageattach', :id,  '--storagectl', 'SATAController', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', disk]
    end

  config.vm.provision "Checkup...", type: "shell" do |s|
    s.path = "bin/00_check.sh"
  end

  config.vm.provision "Partitioning...", type: "shell" do |s|
    s.path = "bin/24_partitioning.sh"
  end

  config.vm.provision "Creating filesystems...", type: "shell" do |s|
    s.path = "bin/25_mkfs.sh"
  end

  config.vm.provision "Mounting lfs...", type: "shell" do |s|
    s.path = "bin/27_mount.sh"
  end

end
