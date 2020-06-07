<?php namespace Wollson\GeneralPages\Components;

use BackendAuth;
use Cms\Classes\Page;
use Cms\Classes\ComponentBase;
use Wollson\GeneralPages\Models\GeneralPages;

class GeneralPagesComponent extends ComponentBase
{
    /**
     * @var RainLab\Blog\Models\Widgets The widgets model used for display.
     */
    public $pages;

    public function componentDetails()
    {
        return [
            'name'        => 'Pages',
        ];
    }

    public function defineProperties()
    {
        return [
            'pageFilter' => [
                'title'       => 'Page id:',
                'type'        => 'string',
                'default'     => ''
            ],
        ];
    }

    public function onRun()
    {
        $page_id = $this->property('pageFilter') != NULL ? $this->property('pageFilter') : false;
    	$this->pages = $this->page['page'] = $this->getPage($page_id);
    }


    protected function getPage($page_id){
    	$pages = new GeneralPages();
        
        $pages = $pages->where('id',$page_id)->first();

        return $pages;
    }
}