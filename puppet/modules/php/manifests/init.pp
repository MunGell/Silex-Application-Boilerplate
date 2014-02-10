class php {
    $packages = [
        "php5", 
        "php5-cli", 
        "php5-mysql", 
        "php-pear", 
        "php5-xdebug", 
        "php5-dev", 
        "php-apc", 
        "php5-mcrypt", 
        "php5-gd", 
        "php5-curl",
        "libapache2-mod-php5"
    ]


    package { $packages:
        ensure  => latest,
        require => [
            Exec['apt-get update'], 
            Package['python-software-properties']
        ]
    }

    file { "/etc/php5/apache2/php.ini":
        ensure  => present,
        owner => root, 
        group => root,
        source  => "/vagrant/puppet/templates/php.ini",
        require => [
            Package['php5'], 
            Package['apache2']
        ],
    }   
}