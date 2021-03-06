<?php

$params = require(__DIR__ . '/params.php');
$snippets = require(__DIR__ . '/snippets.php');

$theme = 'bourbon';

$config = [
    'id' => 'hjem',
    'language' => 'da_DK',
    'basePath' => dirname(__DIR__),
    'defaultRoute' => '/wiki/page',
    'layout' => '@app/themes/' . $theme . '/views/layouts/main.jade',
    'bootstrap' => ['log'],
    'components' => [
        'request' => [
            // !!! insert a secret key in the following (if it is empty) - this is required by cookie validation
            'cookieValidationKey' => '',
        ],
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
        'user' => [
            'identityClass' => '\yii\web\IdentityInterface',
        ],
        'errorHandler' => [
            'errorAction' => '/wiki/page/error',
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'urlManager' => [
            'enablePrettyUrl' => true,
            'showScriptName' => false,
            'rules' => [
                [
                    'pattern' => '/feed',
                    'route' => '/wiki/page/rss',
                ],
                [
                    'pattern' => '<id:[\w_\/-]+>',
                    'route' => '/wiki/page/view',
                    'encodeParams' => false
                ],
                [
                    'pattern' => '<module:\w+>/<controller:\w+>/<action:\w+>/<id:[\w_\/-]+>',
                    'route' => '<module>/<controller>/<action>',
                    'encodeParams' => false
                ],
                '<module:\w+>/<controller:\w+>/<action:\w+>'=>'<module>/<controller>/<action>',
            ],
        ],
        'assetManager' => [
            'linkAssets' => true,
            'appendTimestamp' => true,
        ],
        'view' => [
            'class' => 'jacmoe\mdpages\components\View',
            'defaultExtension' => 'jade',
            'renderers' => [
                'jade' => [
                    'class' => 'jacmoe\talejade\JadeViewRenderer',
                    'cachePath' => '@runtime/Jade/cache',
                    'options' => [
                        'pretty' => true,
                        'lifeTime' => {{jade_cache_lifetime}}
                    ],
                ],
            ],
            'theme' => [
                'basePath' => '@app/themes/' . $theme,
                'baseUrl' => '@web/themes/' . $theme,
                'pathMap' => [
                    '@app/views' => '@app/themes/' . $theme . '/views',
                    '@jacmoe/mdpages/views' => '@app/themes/' . $theme . '/views',
                ],
            ],
        ],
    ],
    'modules' => [
        'wiki' => [
            'class' => 'jacmoe\mdpages\Module',
            'repository_url' => 'https://github.com/{{github_owner}}/{{github_repo}}.git',
            'github_token' => '{{github_token}}',
            'github_owner' => '{{github_owner}}',
            'github_repo' => '{{github_repo}}',
            'github_branch' => '{{github_branch}}',
            'absolute_wikilinks' => true,
            'generate_page_toc' => false,
            'feed_title' => 'Blog indlæg',
            'feed_description' => 'Den Stammende Kok Rss Feed',
            'feed_author_email' => 'jacmoe.dk@gmail.com',
            'feed_author_name' => 'Jacob Moen',
            'feed_ordering' => 'datetime DESC',
            'feed_filtering' => true,
            'generate_contributor_data' => false,
            'snippets' => $snippets,
        ],
    ],
    'params' => $params,
];

return $config;
