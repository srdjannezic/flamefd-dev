<?php namespace Wollson\GeneralPages\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateWollsonGeneralpages extends Migration
{
    public function up()
    {
        Schema::table('wollson_generalpages_', function($table)
        {
            $table->string('name', 255)->nullable();
            $table->increments('id')->unsigned(false)->change();
        });
    }
    
    public function down()
    {
        Schema::table('wollson_generalpages_', function($table)
        {
            $table->dropColumn('name');
            $table->increments('id')->unsigned()->change();
        });
    }
}
