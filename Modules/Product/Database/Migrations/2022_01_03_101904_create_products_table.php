<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->integer('stock_acc_id')->nullable();
            $table->integer('stock_id')->nullable();
            $table->integer('user_id')->nullable();
            $table->integer('shipment_id')->nullable();
            $table->integer('invoice_id')->nullable();
            $table->integer('mark_id')->nullable();
            $table->foreign('stock_id')->references('id')->on('stocks')->onDelete('cascade');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('shipment_id')->references('id')->on('shipments')->onDelete('cascade');
            $table->foreign('invoice_id')->references('id')->on('invoices')->onDelete('cascade');
            $table->foreign('mark_id')->references('id')->on('marks')->onDelete('cascade');

            $table->text('imei')->nullable();
            $table->string('price')->nullable();
            $table->string('bonus')->nullable();
            $table->string('expense')->nullable();
            $table->string('cost')->nullable();
            $table->string('sell_price')->nullable();
            $table->string('stock_price')->nullable();
            $table->integer('order_id')->nullable();
            $table->integer('status')->nullable();
            $table->text('note')->nullable();
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
        Schema::dropIfExists('products');
    }
}
