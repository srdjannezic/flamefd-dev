<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInitb8e491ee8b84194e19df2ad0039a2ea7
{
    public static $prefixesPsr0 = array (
        's' => 
        array (
            'sngrl\\SphinxSearch' => 
            array (
                0 => __DIR__ . '/..' . '/sngrl/sphinxsearch/src',
            ),
        ),
        'S' => 
        array (
            'Sphinx' => 
            array (
                0 => __DIR__ . '/..' . '/gigablah/sphinxphp/src',
            ),
        ),
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixesPsr0 = ComposerStaticInitb8e491ee8b84194e19df2ad0039a2ea7::$prefixesPsr0;

        }, null, ClassLoader::class);
    }
}
