<?php namespace Wollson\GeneralPages\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateWollsonGeneralpages5 extends Migration
{
    public function up()
    {
        Schema::table('wollson_generalpages_', function($table)
        {
            $table->increments('id')->unsigned(false)->change();
            $table->string('section_type')->change();
            $table->renameColumn('section_content', 'content');
        });
    }
    
    public function down()
    {
        Schema::table('wollson_generalpages_', function($table)
        {
            $table->increments('id')->unsigned()->change();
            $table->string('section_type', 191)->change();
            $table->renameColumn('content', 'section_content');
        });
    }
}
