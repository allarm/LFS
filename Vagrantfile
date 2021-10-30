# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.provision "checkup", type: "shell" do |s|
    s.path = "bin/00_check.sh"
  end

end
