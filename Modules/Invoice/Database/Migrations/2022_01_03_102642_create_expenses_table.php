<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateExpensesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('expenses', function (Blueprint $table) {
            $table->id();
            $table->integer('invoice_id')->nullable();
            $table->string('name')->nullable();
            $table->string('type')->nullable();
            $table->string('note')->nullable();
            $table->string('expense')->nullable();
            $table->string('mark_id')->nullable();
            $table->integer('main_currency_id')->nullable();
            $table->string('main_currency_pay')->default(0);
            $table->string('main_currency_rate')->default(0);
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
        Schema::dropIfExists('expenses');
    }
}
