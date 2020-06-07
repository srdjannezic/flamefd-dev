<?php namespace Wollson\GeneralPages;

use System\Classes\PluginBase;

class Plugin extends PluginBase
{
    public function registerComponents()
    {
    	return [
    		'Wollson\GeneralPages\Components\GeneralPagesComponent'       => 'page'
    	];
    }

    public function registerSettings()
    {
    }
}
