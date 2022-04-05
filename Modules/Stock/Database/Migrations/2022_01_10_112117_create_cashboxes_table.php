<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCashboxesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cashboxes', function (Blueprint $table) {
            $table->id();
            $table->string('date')->nullable();
            $table->integer('invoice_id')->nullable();
            $table->integer('client_id')->nullable();
            $table->integer('stock_id')->nullable();
            $table->integer('type')->nullable();
            $table->string('income')->default(0)->nullable();
            $table->string('expend')->default(0)->nullable();
            $table->string('submitted')->default(0)->nullable();
            $table->string('residue')->default(0)->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('cashboxes');
    }
}
