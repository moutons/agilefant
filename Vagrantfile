# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "puppetlabs/centos-6.5-64-puppet-enterprise"
  config.vm.network :public_network
  config.vm.provision "shell", inline: "/usr/local/bin/puppet module install puppetlabs/mysql"
  config.vm.provision "shell", inline: "/usr/local/bin/puppet module install puppetlabs/firewall"
  config.vm.provision "shell", inline: "/usr/local/bin/puppet module install puppetlabs/apache"
  #config.vm.provision "shell", inline: "/usr/local/bin/puppet module install puppetlabs/java"
  #config.vm.provision "shell", inline: "/usr/local/bin/puppet module install BoxUpp/tomcat"
  config.vm.hostname = "agilefant"
  config.vm.provider :virtualbox do |vb|
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end
end
