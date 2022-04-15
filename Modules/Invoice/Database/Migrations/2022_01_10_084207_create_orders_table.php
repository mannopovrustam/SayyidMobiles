<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->string('client_id')->nullable();
            $table->integer('stock_id')->nullable();
            $table->foreign('stock_id')->references('id')->on('stocks')->onDelete('cascade');
            $table->foreign('client_id')->references('id')->on('clients')->onDelete('cascade');
            $table->string('order_type')->nullable();
            $table->string('invoice_id')->nullable();
            $table->foreign('invoice_id')->references('id')->on('invoices')->onDelete('cascade');
            $table->string('date')->nullable();
            $table->integer('quantity')->nullable();
            $table->string('amount')->nullable();
            $table->string('total_amount')->nullable();
            $table->string('payment_type')->nullable();
            $table->integer('sum_id')->nullable();
            $table->string('discount')->nullable();
            $table->text('products')->nullable();
            $table->text('products_price')->nullable();
            $table->softDeletes();
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
        Schema::dropIfExists('orders');
    }
}
