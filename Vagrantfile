# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "512"
    vb.customize ["modifyvm", :id, "--audio", "none"]
  end

  # must be at the top
  config.vm.define "lb-0" do |c|
      c.vm.hostname = "lb-0"
      c.vm.network "private_network", ip: "10.0.0.40"

      c.vm.provision :shell, :path => "scripts/vagrant-setup-haproxy.bash"

      c.vm.provider "virtualbox" do |vb|
      end
  end

  (0..2).each do |n|
    config.vm.define "controller-#{n}" do |c|
        c.vm.hostname = "controller-#{n}"
        c.vm.network "private_network", ip: "10.0.0.1#{n}"

        c.vm.provision :shell, :path => "scripts/vagrant-setup-hosts-file.bash"

        c.vm.provider "virtualbox" do |vb|
          vb.memory = "750"
        end
    end
  end

  (0..2).each do |n|
    config.vm.define "worker-#{n}" do |c|
        c.vm.hostname = "worker-#{n}"
        c.vm.network "private_network", ip: "10.0.0.2#{n}"

        c.vm.provision :shell, :path => "scripts/vagrant-setup-routes.bash"
        c.vm.provision :shell, :path => "scripts/vagrant-setup-hosts-file.bash"
    end
  end

  config.vm.define "traefik-0", autostart: false do |c|
      c.vm.hostname = "traefik-0"
      c.vm.network "private_network", ip: "10.0.0.30"

      c.vm.provision :shell, :path => "scripts/vagrant-setup-routes.bash"
  end
end
