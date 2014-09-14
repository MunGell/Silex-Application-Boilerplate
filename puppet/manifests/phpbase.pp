#our main manifest file phpbase.pp

# set our default paths
#Adding a path to every exec is annoying, easy to forget and leads to unneeded duplication. 
#By placing the Exec shown below in a global location (like this file) all execs will use this path by default, while still allowing you to add extra directories to the path where needed.
Exec {
	path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin", "/usr/local/bin", "/usr/local/sbin"]
}

#execute the following command
exec { 

	#this is our command name
    'apt-get update':

    	#the command to be executed
        command => '/usr/bin/apt-get update',

        #load in the class that contains the update repo command (php55)
        require => Exec['add php54 apt-repo']
}

#each of the following commands includes a module
#each module has a basic folder structure '<name of module>/manifests/init.pp'
#so for our apache module it will be 'puppet/modules/apache/manifests/init.pp'
#the name of the class defined must also have a class defined, with the same name as the module name
#so for the apache example, puppet/modules/apache/manifests/init.pp' would contain a class called 'apache'
# include bootstrap
include update
include composer
include apache
include php54
include php
include mysql
include silex