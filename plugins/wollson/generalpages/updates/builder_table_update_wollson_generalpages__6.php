<?php namespace Wollson\GeneralPages\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateWollsonGeneralpages6 extends Migration
{
    public function up()
    {
        Schema::table('wollson_generalpages_', function($table)
        {
            $table->text('descriptions')->nullable();
            $table->string('section_type')->change();
        });
    }
    
    public function down()
    {
        Schema::table('wollson_generalpages_', function($table)
        {
            $table->dropColumn('descriptions');
            $table->string('section_type', 191)->change();
        });
    }
}
