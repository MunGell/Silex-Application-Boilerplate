Vagrant.configure("2") do |config|

    config.vm.box = "precise64"
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"

    config.vm.network :private_network, ip: "192.168.50.100"
    config.vm.network :forwarded_port, host: 8080, guest: 80
    config.ssh.forward_agent = true

    config.vm.hostname = "silex"

    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.hostmanager.ignore_private_ip = true
    config.hostmanager.include_offline = true
    config.hostmanager.aliases = %w(silex.dev silex.local)

    config.vm.synced_folder "./www", "/var/www", mount_options: ["dmode=777", "fmode=777"]

    config.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        v.customize ["modifyvm", :id, "--memory", 2048]
        v.customize ["modifyvm", :id, "--name", "Silex"]
    end

    config.vm.provision :shell, :inline => "echo \"Europe/London\" | sudo tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata"

    config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "puppet/manifests"
        puppet.manifest_file  = "phpbase.pp"
        puppet.module_path = "puppet/modules"
        #puppet.options = "--verbose --debug"
    end
    
    config.vm.provision :shell, :path => "puppet/scripts/enable_remote_mysql_access.sh"

end