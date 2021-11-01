# -*- mode: ruby -*-
# vi: set ft=ruby :

disk = './lfs.vdi'
lfs = '/mnt/lfs'
packages_version = '11.0'
lfs_user = "lfs"
lfs_pass = "lfs"
lfs_group = "lfs"

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

  config.vm.provision "Setting variables...", type: "shell" do |s|
    s.path = "bin/27_set_vars.sh"
  end

  config.vm.provision "Mounting lfs file systems, enabling swap...", type: "shell" do |s|
    s.path = "bin/27_mount.sh"
    s.env = {"LFS" => lfs}
  end

  config.vm.provision "Creating directory layout...", type: "shell" do |s|
    s.path = "bin/40_dir_layout.sh"
    s.env = {"LFS" => lfs}
  end

  # You can keep the copy of the sources tarball in local files,
  # instead of downloading it
  config.vm.provision "Copying sources from local storage...", type: "file" do |s|
    s.source = "files/lfs/sources"
    s.destination = "/mnt/lfs/sources"
  end

  # If files were uploaded from local storage, it will be skipped
  config.vm.provision "Downloading sources...", type: "shell" do |s|
    s.path = "bin/31_sources.sh"
    s.env = {"LFS" => lfs, "PACKAGES_VERSION" => packages_version}
  end

  config.vm.provision "Unarchiving...", type: "shell" do |s|
    s.path = "bin/33_unarchive.sh"
    s.env = {"LFS" => lfs, "PACKAGES_VERSION" => packages_version}
  end

  config.vm.provision "Configuring user...", type: "shell" do |s|
    s.path = "bin/43_add_user.sh"
    s.env = {
      "LFS" => lfs,
      "PACKAGES_VERSION" => packages_version,
      "LFS_USER" => lfs_user,
      "LFS_GROUP" => lfs_group,
      "LFS_PASS" => lfs_pass
    }
  end

end
