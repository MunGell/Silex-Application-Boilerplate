class php {
    $packages = [
        "php5",
        "php-apc",
        "php-gettext",
        "php5-cli",
        "php5-common",
        "php5-curl",
        "php5-gd",
        "php5-fpm",
        "php5-mcrypt",
        "php5-memcache",
        "php5-mysql",
        "php5-xdebug",
        "php5-intl",
        "php5-ldap",
        "php5-dev",
        "php5-json",
        'php5-imagick',
        "libapache2-mod-php5"
    ]

    package { $packages:
        ensure  => latest,
        require => [
            Exec['apt-get update'], 
            Package['python-software-properties']
        ]
    } 
}