<?php

use Silex\Provider\MonologServiceProvider;
use Silex\Provider\WebProfilerServiceProvider;

ini_set('xdebug.collect_vars', 'on');
ini_set('xdebug.collect_params', '4');
ini_set('xdebug.dump_globals', 'on');
ini_set('xdebug.dump.SERVER', 'REQUEST_URI');
ini_set('xdebug.show_local_vars', 'on');

// include the prod configuration
require __DIR__.'/prod.php';

// enable the debug mode
$app['debug'] = true;

$app->register(new MonologServiceProvider(), array(
    'monolog.logfile' => __DIR__.'/../logs/silex_dev.log',
));

$app->register($p = new WebProfilerServiceProvider(), array(
    'profiler.cache_dir' => __DIR__.'/../cache/profiler',
));
$app->mount('/_profiler', $p);
