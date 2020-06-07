<?php namespace Wollson\Widgets\Components;

use BackendAuth;
use Cms\Classes\Page;
use Cms\Classes\ComponentBase;
use Wollson\Widgets\Models\Widgets;

class WidgetComponent extends ComponentBase
{
    /**
     * @var RainLab\Blog\Models\Widgets The widgets model used for display.
     */
    public $widgets;

    public function componentDetails()
    {
        return [
            'name'        => 'Widgets',
        ];
    }

    public function defineProperties()
    {
        return [
            'regionFilter' => [
                'title'       => 'Region',
                'type'        => 'string',
                'default'     => ''
            ],
        ];
    }

    public function onRun()
    {
        $region_id = $this->property('regionFilter');
    	$this->widgets = $this->page['widgets'] = $this->getWidget($region_id);
    }


    protected function getWidget($region_id){
    	$widget = new Widgets();
    	return $widget->where('region_id',$region_id)->get();
    }
}