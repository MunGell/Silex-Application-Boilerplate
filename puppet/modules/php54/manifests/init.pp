#PHP 5.4 setup 
#this will update php to the lastest version, otherwise it will be set to the Guest OS default
class php54 {

    package { "python-software-properties":
    		ensure => present,
    		require => Exec['php54 apt update']
    }

    #our command to execute the update repo
   	exec { 'add php54 apt-repo':

   			#and load it from the following address
   			#https://launchpad.net/~ondrej/+archive/php5

   			#this will load in php 5.4.latest
	        command => '/usr/bin/add-apt-repository ppa:ondrej/php5-oldstable -y',

	        #this will load in the lastest php 5 (5.5.x)
	        # command => '/usr/bin/add-apt-repository ppa:ondrej/php5 -y',

	        #and ensure we have loaded the update from above
	        require => Package['python-software-properties'],
	}

	exec { "php54 apt update":
		command => 'apt-get update',
	}

	file { "/etc/php5/apache2/php.ini":
	    ensure  => present,
	    owner => root, 
	    group => root,
	    source  => "/vagrant/puppet/templates/php5-4.ini",
	    require => [
	        Package['php5'], 
	        Package['apache2']
	    ],
	}  
}
