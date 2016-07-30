# -*- mode: ruby -*-
# vi: set ft=ruby :i

Vagrant.configure(2) do |config|
  config.vm.box = 'bento/ubuntu-16.04'
  config.vm.hostname = 'sententiaregum-deployment'
  config.vm.network :private_network, :ip => '192.168.56.112'
  config.vm.provider :virtualbox do |vb|
    vb.name = 'Sententiaregum Deployment Testing VM'
  end
  config.vm.provision :shell, :path => './setup.sh'
end
