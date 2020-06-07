<?php namespace Wollson\GeneralPages\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateWollsonGeneralpages4 extends Migration
{
    public function up()
    {
        Schema::table('wollson_generalpages_', function($table)
        {
            $table->text('animation_type')->nullable();
        });
    }
    
    public function down()
    {
        Schema::table('wollson_generalpages_', function($table)
        {
            $table->dropColumn('animation_type');
        });
    }
}
