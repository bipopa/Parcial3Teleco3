# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|


if Vagrant.has_plugin? "vagrant-vbguest"
 config.vbguest.no_install = true
 config.vbguest.auto_update = false
 config.vbguest.no_remote = true
 end

 config.vm.define :firewallPF do |firewallPF|
 firewallPF.vm.box = "centos/stream8" 
 firewallPF.vm.network "public_network", ip: "192.168.1.45"
 firewallPF.vm.network :private_network, ip: "192.168.10.30"
 firewallPF.vm.hostname = "firewallPF"
 firewallPF.vm.provision :shell, :path => "basico.sh"
 firewallPF.vm.provision :shell, :path => "configfirewall.sh"
 end

 config.vm.define :streama do |streama|
 streama.vm.box = "centos/stream8" 
 streama.vm.network :private_network, ip: "192.168.10.20"
 streama.vm.hostname = "serverStreama"
 streama.vm.provision :shell, :path => "basico.sh" 
 streama.vm.provision :shell, :path => "streama.sh"
 streama.vm.provision :shell, :path => "configstreama.sh"

 end

end

