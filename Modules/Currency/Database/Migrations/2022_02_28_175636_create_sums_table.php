<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSumsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sums', function (Blueprint $table) {
            $table->id();
            $table->integer('sum_currency_id')->nullable();
            $table->string('sum_currency_pay')->nullable();
            $table->string('sum_currency_pay_get')->nullable();
            $table->string('sum_currency_pay_will')->nullable();
            $table->string('discount')->nullable();
            $table->integer('main_currency_id')->nullable();
            $table->string('main_currency_pay')->default(0);
            $table->string('main_currency_rate')->default(0);
            $table->string('second_currency_id')->nullable();
            $table->string('second_currency_pay')->nullable();
            $table->string('second_currency_rate')->nullable();
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
        Schema::dropIfExists('sums');
    }
}
