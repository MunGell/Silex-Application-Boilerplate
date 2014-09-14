
#define our apache class, this name must match the module folder name and be within a file called init.pp
class apache {
      
    #define our apache2 package and use the Exec command 'apt-get update' to get it
    package { "apache2":
        ensure => present,
        require => Exec['apt-get update']
    }
    
    #make sure the apache2 service is running and ensure the package apache2 is installed before commensing
    service { "apache2":
        ensure => running,
        enable => true,
        require => Package['apache2'],
        subscribe => [
            File["/etc/apache2/mods-enabled/rewrite.load"],
            File["/etc/apache2/sites-available/default"]
        ],
    }

    #link the file 'rewrite.load' in mods-enabled...
    file { "/etc/apache2/mods-enabled/rewrite.load":
        ensure => link,

        #...to the rewrite.load in mods-available
        target => "/etc/apache2/mods-available/rewrite.load",

        #but ensure that the apache2 package is installed
        require => Package['apache2'],
    }

    #set the default apache virtual host and take the content from out template file found /templates/vhost
    file { "/etc/apache2/sites-available/default":
        ensure => present,
        owner => root, 
        group => root,
        source => "/vagrant/puppet/templates/vhost",

        #ensure that we have a package called apache2 before running
        #this package is defined above
        require => Package['apache2'],
    }

    #output to the screen and also write to a file inside conf.d (read about 'tee' here http://linux.101hacks.com/unix/tee-command-examples/)
    exec { 'echo "ServerName silex.dev" | sudo tee /etc/apache2/conf.d/fqdn':
        require => Package['apache2'],
    }
}