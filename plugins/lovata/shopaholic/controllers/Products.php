<?php namespace Lovata\Shopaholic\Controllers;

use BackendMenu;
use Backend\Classes\Controller;
use Backend\Classes\BackendController;
use Lovata\Shopaholic\Models\Product;
use Lovata\Shopaholic\Classes\Helper\CurrencyHelper;

/**
 * Class Products
 * @package Lovata\Shopaholic\Controllers
 * @author Andrey Kharanenka, a.khoronenko@lovata.com, LOVATA Group
 */
class Products extends Controller
{
    public $implement = [
        'Backend.Behaviors.ListController',
        'Backend.Behaviors.FormController',
        'Backend.Behaviors.RelationController',
        'Backend.Behaviors.ImportExportController',
    ];

    public $listConfig = 'config_list.yaml';
    public $formConfig = 'config_form.yaml';
    public $relationConfig = 'config_relation.yaml';
    public $importExportConfig = 'config_import_export.yaml';

    /**
     * Products constructor.
     */
    public function __construct()
    {
        CurrencyHelper::instance()->disableActiveCurrency();

        if (BackendController::$action == 'import') {
            Product::extend(function ($obModel) {
                $obModel->rules['external_id'] = 'required';
            });
        }

        parent::__construct();
        BackendMenu::setContext('Lovata.Shopaholic', 'shopaholic-menu-main', 'shopaholic-menu-products');
    }
}
