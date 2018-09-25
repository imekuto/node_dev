# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # ---- BOX自体の設定 ----
  config.vm.box = "ubuntu/bionic64"
  config.vm.box_check_update = false

  # ---- ネットワーク設定 ----
  config.vm.network "forwarded_port", guest: 80, host: 8080

  # ---- プロビジョニングスクリプトのフォルダの共有設定 ----
  config.vm.synced_folder "./provision-script", "/home/vagrant/provision-script"

  # ---- projectフォルダの共有設定 ----
  config.vm.synced_folder "./project", "/home/vagrant/project"

  # ---- VM自体の設定 ----
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "512"
  end
end
