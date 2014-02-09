
#define our update module's class name
class update {

	#define a package called 'curl'...
    package { "curl":
        ensure  => present,

        #which requires the unix command 'apt-get update' to be installed
        require => Exec['apt-get update']
    }
}