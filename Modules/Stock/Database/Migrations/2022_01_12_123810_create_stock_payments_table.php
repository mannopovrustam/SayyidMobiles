<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateStockPaymentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('stock_payments', function (Blueprint $table) {
            $table->id();
            $table->integer('stock_from')->nullable();
            $table->foreign('stock_from')->references('id')->on('stocks')->onDelete('cascade');
            $table->integer('stock_to')->nullable();
            $table->integer('sum_id')->nullable();
            $table->string('date')->nullable();
            $table->string('note')->nullable();
            $table->string('type')->default(1);
            $table->string('status')->default(0)->nullable();
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
        Schema::dropIfExists('stock_payments');
    }
}
