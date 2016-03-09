# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network :private_network, ip: "192.168.65.2"

  config.vm.network "forwarded_port", guest: 3000, host: 3000, auto_correct:true
  config.vm.network "forwarded_port", guest: 8983, host: 8983, auto_correct:true
  config.vm.network "forwarded_port", guest: 8984, host: 8984, auto_correct:true

  # config.vm.synced_folder ".", "/vagrant", type: "nfs"

	config.vm.synced_folder "src/", "/home/vagrant/hydra/itma.hydra",
	    :nfs => true,
	    :mount_options => ['actimeo=2','rw', 'vers=3', 'tcp', 'nolock']

	config.vm.synced_folder "scripts/", "/vagrant/scripts",
	    :nfs => true,
	    :mount_options => ['actimeo=2','rw', 'vers=3', 'tcp', 'nolock']

  config.vm.provision :shell, path: "provision.sh"

  config.trigger.after :up do
    run_remote "bash /vagrant/scripts/post_provision.sh"
  end
end
