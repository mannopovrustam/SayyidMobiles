<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateClientOperationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('client_operations', function (Blueprint $table) {
            $table->id();
            $table->integer('invoice_id')->nullable();
            $table->foreign('invoice_id')->references('id')->on('invoices')->onDelete('cascade');
            $table->integer('client_id')->nullable();
            $table->foreign('client_id')->references('id')->on('clients')->onDelete('cascade');
            $table->integer('client_payment_id')->nullable();
            $table->foreign('client_payment_id')->references('id')->on('client_payments')->onDelete('cascade');
            $table->string('date')->nullable();
            $table->string('operation')->nullable();
            $table->integer('type')->nullable();
            $table->integer('sum_currency_id')->nullable();
            $table->integer('sum_id')->nullable();
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
        Schema::dropIfExists('client_operations');
    }
}
