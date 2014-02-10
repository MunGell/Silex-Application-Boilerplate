<?php

use Silex\Application;
use Silex\Provider\TwigServiceProvider;
use Silex\Provider\UrlGeneratorServiceProvider;
use Silex\Provider\ValidatorServiceProvider;
use Silex\Provider\ServiceControllerServiceProvider;
use Silex\Provider\FormServiceProvider; 
use Doctrine\DBAL\Schema\Table;
use Silex\Provider\TranslationServiceProvider;

$app = new Application();
$app->register(new UrlGeneratorServiceProvider());
$app->register(new ValidatorServiceProvider());
$app->register(new ServiceControllerServiceProvider());

//define out db connection details for the Doctrine driver
$app->register(new Silex\Provider\DoctrineServiceProvider(), array(
	'db.options' => array(
		'driver' => 'pdo_mysql', 
		'dbname' => 'silex', 
		'host' => '127.0.0.1', 
		'user' => 'root', 
		'password' => 'root'
	)
));

//generate the db schema isntance / data
$schema = $app['db']->getSchemaManager();

//check for a todo table 
if (! $schema->tablesExist('todo')) {

    $todo = new Table('todo');
    $todo->addColumn('id', 'integer', array('unsigned' => true, 'autoincrement' => true));
    $todo->setPrimaryKey(array('id'));
    $todo->addColumn('title', 'string', array('length' => 255));
    $todo->addColumn('complete', 'integer', array('length' => 1));
    $todo->addColumn('created_at', 'datetime', array('length' => 19));
    $todo->addColumn('updated_at', 'datetime', array('length' => 19));
    $check = $schema->createTable($todo);

    //add a new entry
	$time = date('Y-m-d H:i:s');
    $app['db']->insert('todo', array(
		'title' => 'Your first todo', 
		'complete' => 0,
		'created_at' => $time, 
		'updated_at' => $time
	));
}

//required for forms, must be before twig
$app->register(new FormServiceProvider());
$app->register(new TranslationServiceProvider(), array('locale_fallback' => 'en'));

//register twig and pass in the required fields, also enabling debug functions
$app->register(new TwigServiceProvider(), array(
    'twig.path'    => array(__DIR__.'/../templates'),
    'twig.options' => array(
    	'cache' => __DIR__ . '/../cache/twig', 
    	'debug' => true
    )
));

return $app;