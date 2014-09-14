class silex {

	$silexRoot = "/var/www"

   	exec { 'install silex':
	    command => 'rm -rf /var/www/* && /usr/local/bin/composer create-project fabpot/silex-skeleton /var/www',
	    require => Package['php5-cli'],
	}
}