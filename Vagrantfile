Vagrant::Config.run do |config|
    config.vm.define :silex54 do |config|
        config.vm.box = "precise64"
        config.vm.box_url = "http://files.vagrantup.com/precise64.box"
        config.ssh.max_tries = 10
        config.vm.forward_port 80, 8080
        config.vm.forward_port 3306, 3306
        config.vm.host_name = "silex54"
        config.vm.network :hostonly, "192.168.100.100"
        config.vm.share_folder("www", "/var/www", "./htdocs", type: "nfs")

        config.vm.provision :shell, :inline => "echo \"Europe/London\" | sudo tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata"

        config.vm.provision :puppet do |puppet|
            puppet.manifests_path = "puppet/manifests"
            puppet.manifest_file  = "phpbase.pp"
            puppet.module_path = "puppet/modules"
            #puppet.options = "--verbose --debug"
        end
        
        config.vm.provision :shell, :path => "puppet/scripts/enable_remote_mysql_access.sh"
    end
end