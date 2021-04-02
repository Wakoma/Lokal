src_box = "ubuntu/focal64"
ip = ENV["VAGRANT_IP"]
hostname = ENV["DOMAIN"]
name = ENV["PROJECT_NAME"]
Vagrant.configure("2") do |config|
  config.vm.define name do |subconfig|
    subconfig.vm.box = src_box
    subconfig.vm.box_check_update = true
    subconfig.vm.hostname = hostname
    subconfig.vm.network "private_network", ip: ip
    subconfig.vm.synced_folder ".", "/home/vagrant/src"
    subconfig.ssh.forward_agent = true
    subconfig.vm.provider "virtualbox" do |vb|
      vb.name = name
      vb.gui = false
      vb.cpus = 2
      vb.memory = 4096
    end
    subconfig.vm.provision :hosts do |provisioner|
      provisioner.add_host ip, [hostname]
    end
    subconfig.vm.provision :ansible do |ansible|
      ansible.limit = "all"
      ansible.playbook = "config/ansible/base.playbook.yml"
      ansible.extra_vars = {primary_ssh_user: "vagrant"}
    end
  end
end
