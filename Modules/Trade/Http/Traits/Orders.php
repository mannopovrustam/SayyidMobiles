<?php

namespace Modules\Trade\Http\Traits;

use Modules\Invoice\Entities\Order;
use Modules\Invoice\Entities\OrderDetail;
use Modules\Mark\Entities\Mark;
use Modules\Product\Entities\Product;
use Modules\Stock\Entities\Stock;

trait Orders{

    public function order()
    {
        if (session()->get('old_invoice') != 1){
            $this->data_id = request()->get('data_id');
        }
        $this->order = Order::where('invoice_id', $this->data_id)->first();
        if ($this->order){
            $this->order_detail = OrderDetail::where('order_id', $this->order->id)->first();
        }
        if ($this->data_id){
            $this->currency_main = \Modules\Currency\Entities\Currency::find($this->order->pay_cur_main);
            $this->currency_second = \Modules\Currency\Entities\Currency::find($this->order->pay_cur);
            if (session()->get('old_invoice') != 1) {
                $this->discount = $this->order->discount;
                $this->currencyMain = $this->order->currency_main;
                $this->currency = $this->order->currency;
                $this->old_invoice($this->data_id);
                session()->put('old_invoice', 1);
            }
        }

    }

    public function productSearch()
    {
        if (count(Product::where('stock_id', $this->stock_id)->where('imei', $this->searchTerm)->get())>0){
            $mark_id = Product::where('stock_id', $this->stock_id)->where('imei', $this->searchTerm)->first()->mark_id;
            $id = Product::where('stock_id', $this->stock_id)->where('imei', $this->searchTerm)->first()->id;
            $this->addProduct($id);
            $cart = session()->get('cart');
            if(!$cart) {
                $cart = [
                    $mark_id => ["id" => $mark_id]
                ];
                session()->put('cart', $cart);
            }
            $cart[$mark_id] = ["id" => $mark_id];
            session()->put('cart', $cart);
            $this->searchTerm = '';
        }
        $this->searchTermData = $this->searchTerm ? Mark::where('name', 'like', "%{$this->searchTerm}%")->skip(0)->take(5)->get():[];

    }

}
