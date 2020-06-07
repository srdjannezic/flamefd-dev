<?php namespace Lovata\Shopaholic\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateLovataShopaholicCategories extends Migration
{
    public function up()
    {
        Schema::table('lovata_shopaholic_categories', function($table)
        {
            $table->string('featured_size')->nullable();
        });
    }
    
    public function down()
    {
        Schema::table('lovata_shopaholic_categories', function($table)
        {
            $table->dropColumn('featured_size');
        });
    }
}
