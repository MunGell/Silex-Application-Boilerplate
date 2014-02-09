class composer {

	package { 'git-core':
    	ensure => present,
    }

   	exec { 'install composer':
	    command => 'curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin',
	    require => Package['php5-cli'],
	}

	exec { 'global composer':
		command => "sudo mv /usr/local/bin/composer.phar /usr/local/bin/composer",
		require => Exec['install composer'],
	}
}