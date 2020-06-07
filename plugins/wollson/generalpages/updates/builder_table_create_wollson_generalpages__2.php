<?php namespace Wollson\GeneralPages\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateWollsonGeneralpages2 extends Migration
{
    public function up()
    {
        Schema::create('wollson_generalpages_', function($table)
        {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->text('section_content')->nullable();
            $table->string('name', 255)->nullable();
            $table->string('section_type')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('wollson_generalpages_');
    }
}
