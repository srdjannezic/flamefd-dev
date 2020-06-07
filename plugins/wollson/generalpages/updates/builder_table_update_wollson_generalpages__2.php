<?php namespace Wollson\GeneralPages\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateWollsonGeneralpages2 extends Migration
{
    public function up()
    {
        Schema::table('wollson_generalpages_', function($table)
        {
            $table->text('section_content')->nullable();
            $table->string('section_type', 255)->nullable();
        });
    }
    
    public function down()
    {
        Schema::table('wollson_generalpages_', function($table)
        {
            $table->dropColumn('section_content');
            $table->dropColumn('section_type');
        });
    }
}
