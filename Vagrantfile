# -*- mode: ruby -*-
# vi: set ft=ruby  :

machines = {
  "master01" => {"memory" => "512", "cpu" => "1", "ip" => "30", "image" => "ubuntu/jammy64"},
  "master02" => {"memory" => "512", "cpu" => "1", "ip" => "31", "image" => "ubuntu/jammy64"},
  "master03" => {"memory" => "512", "cpu" => "1", "ip" => "32", "image" => "ubuntu/jammy64"},
  "worker01" => {"memory" => "1024", "cpu" => "1", "ip" => "33", "image" => "ubuntu/jammy64"},
  "worker02" => {"memory" => "1024", "cpu" => "1", "ip" => "34", "image" => "ubuntu/jammy64"},
  "worker03" => {"memory" => "1024", "cpu" => "1", "ip" => "35", "image" => "ubuntu/jammy64"}
}

Vagrant.configure("2") do |config|

  machines.each do |name, conf|
    config.vm.define "#{name}" do |machine|
      machine.vm.box = "#{conf["image"]}"
      machine.vm.hostname = "#{name}"
      machine.vm.network "private_network", ip: "192.168.56.#{conf["ip"]}"
      machine.vm.provider "virtualbox" do |vb|
        vb.name = "#{name}"
        vb.memory = conf["memory"]
        vb.cpus = conf["cpu"]
        
      end
      machine.vm.provision "shell", path: "docker.sh"
      
      if "#{name}" == "master01"
        machine.vm.provision "shell", path: "master01.sh"
      elsif "#{name}" == "master02" or "#{name}" == "master03"  
        machine.vm.provision "shell", path: "masters.sh"
      else
        machine.vm.provision "shell", path: "workers.sh"
      end

    end
  end
end
