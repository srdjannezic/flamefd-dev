<?php namespace Wollson\GeneralPages\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateWollsonGeneralpages extends Migration
{
    public function up()
    {
        Schema::create('wollson_generalpages_', function($table)
        {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->text('content')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('wollson_generalpages_');
    }
}
