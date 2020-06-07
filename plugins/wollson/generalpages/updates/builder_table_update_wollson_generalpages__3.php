<?php namespace Wollson\GeneralPages\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateWollsonGeneralpages3 extends Migration
{
    public function up()
    {
        Schema::table('wollson_generalpages_', function($table)
        {
            $table->integer('page_id')->nullable();
        });
    }
    
    public function down()
    {
        Schema::table('wollson_generalpages_', function($table)
        {
            $table->dropColumn('page_id');
        });
    }
}
