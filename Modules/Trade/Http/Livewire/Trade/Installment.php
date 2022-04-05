<?php

namespace Modules\Trade\Http\Livewire\Trade;

use Livewire\Component;
use Modules\Client\Entities\Client;
use Modules\Currency\Entities\Currency;
use Modules\Invoice\Entities\Order;
use Modules\Invoice\Entities\OrderDetail;
use Modules\Mark\Entities\Mark;
use Modules\Product\Entities\Product;
use Modules\Stock\Entities\Stock;
use Modules\Trade\Http\Traits\Orders;

class Installment extends Component
{
    public $modalFormVisible = true;
    public $searchTerm, $searchTermData, $stock_id, $products, $summ, $summ_agree = 0, $initial_payment = 0, $main_currency_pay, $stock;
    public $second_currency_pay, $price, $priceResults, $mark_price, $discount = 0, $discount_offer = 0, $main_currency, $second_currency, $data_id, $date_agreement_month = 12, $every_days, $monthly_pay, $monthly_pay_seller = 0;
    public $client_name, $client_description, $client_type, $order, $order_detail;
    public $remainder, $remainder_second;
    public $second_currency_pay_1 = [];
    public $pay;

    public function mount()
    {
        $this->stock_id = auth()->user()->stock_id;
        $this->stock = Stock::find($this->stock_id);
        foreach (explode("|", $this->stock->second_currency_id) as $item){
            $this->second_currency_pay_1[$item] = 0;
        }
    }

    public function render()
    {
        $this->stock_id = auth()->user()->stock_id;
        $this->stock = Stock::find($this->stock_id);

        if(\Modules\Stock\Entities\Stock::find($this->stock_id)){
            $this->main_currency = \Modules\Currency\Entities\Currency::find(\Modules\Stock\Entities\Stock::find($this->stock_id)->main_currency_id);
            $this->second_currency = \Modules\Currency\Entities\Currency::find(\Modules\Stock\Entities\Stock::find($this->stock_id)->second_currency_id);
        }

        $this->order();
        $this->productSearch();

        if(session()->get('product')){
            $this->price();
        }

//        $this->remainder = $this->summ;
//        if($this->main_currency_pay){
//            $this->remainder = (double)$this->remainder - (double)$this->remainder_second - (double)$this->main_currency_pay;
//        }
        if($this->second_currency_pay_1 != null){
            $this->pay = 0;
            foreach($this->second_currency_pay_1 as $key => $value){
                    $this->pay += (double)$value/(double)currency($key)->rate;
                }
        }
        $this->initial_payment = (double)$this->main_currency_pay + (double)$this->pay;
        $this->monthly_pay = ($this->summ - $this->initial_payment)/$this->date_agreement_month;
        if($this->monthly_pay_seller != 0){
            $this->discount_offer = ((double)$this->monthly_pay_seller - (double)$this->monthly_pay)*(double)$this->date_agreement_month;
        }
//        $this->sum_currency_pay_get = round($this->summ - $this->remainder, 5);

        if($this->monthly_pay_seller != 0){
            $this->summ = $this->summ - (double)$this->discount + $this->discount_offer;
        }else{
            $this->summ = $this->summ - (double)$this->discount;
        }
        return view('trade::livewire.trade.installment');
    }

    use Orders;

    public function old_invoice($id)
    {
        foreach (Order::where('invoice_id', $id)->get() as $item){
            foreach (Product::where('order_id', $item->id)->get() as $val){
                $this->addCart($val->mark_id);
                $this->addProduct($val->id);
                $this->priceResults[$val->mark_id] = $val->sell_price;
                $this->summ += $val->sell_price;
            }
            foreach (OrderDetail::where('order_id', $item->id)->get() as $val) {
                $this->monthly_pay = $val->monthly_pay;
                $this->every_days = $val->every_days;
                $this->date_agreement_month = $val->date_agreement_month;
            }
            $this->main_currency_pay = $item->main_currency_pay;
            $this->second_currency_pay = $item->second_currency_pay;
            $this->discount = $item->discount;
            $this->summ = $this->summ - $this->discount;
        }
        $this->calculate();
    }

//    public function calculate(){
//        //$this->price();
//        $this->main_currency_payF();
//        $this->second_currency_payF();
//    }

    public function price()
    {
        $this->mark_price = 0;
        $this->summ = 0;
        session()->put('mark_price', $this->priceResults);
        if (session()->get('mark_price')){
            foreach(session()->get('product') as $key => $value){
                foreach (session()->get('mark_price') as $item => $item2){
                    if ($value['mark_id'] == $item){
                        $this->summ += $item2;
                    }
                }
            }
        }
    }

//    public function main_currency_payF(){
//        $usdM = 1/(double)Currency::find($this->main_currency->id)->rate;
//        $crr = (double)Currency::find($this->second_currency->id)->rate;
//
//        $usd = 1/(double)Currency::find($this->second_currency->id)->rate;
//        $crrM = (double)Currency::find($this->main_currency->id)->rate;
//
//        $this->summ_agree = 0;
//        $this->initial_payment = 0;
//
//        $this->summ_agree =  number_format(($this->second_currency_pay ? $this->second_currency_pay:0)*$usd*$crrM, 1, '.', '') + ($this->main_currency_pay?$this->main_currency_pay:0);
//        $this->initial_payment = $this->summ - $this->summ_agree;
//
//    }
//    public function second_currency_payF(){
//        $usd = 1/(double)Currency::find($this->second_currency->id)->rate;
//        $crrM = (double)Currency::find($this->main_currency->id)->rate;
//        $this->summ_agree = 0;
//        $this->price_agree = 0;
//
//        $this->summ_agree = ($this->main_currency_pay?$this->main_currency_pay:0) + number_format(($this->second_currency_pay ? $this->second_currency_pay:0)*$usd*$crrM, 1, '.', '');
//        $this->initial_payment = $this->summ - $this->summ_agree;
//    }
//    public function discountF(){
//        $this->main_currency_payF();
//        $this->second_currency_payF();
//    }

    public function openProductsModal()
    {
        $this->modalFormVisible = true;
    }

    public function addCart($id)
    {
        $product = Mark::find($id);
        if(!$product) {abort(404);}
        $cart = session()->get('cart');
        if(!$cart) { $cart = [ $id => ["id"=>$id] ]; }
        else{ $cart[$id] = ["id" => $id]; }
        session()->put('cart', $cart);
    }

    public function removeAll()
    {
        session()->forget('cart');
        session()->forget('product');
    }
    public function removeCart($id)
    {
        $cart = session()->get('cart');
        $product = session()->get('product');

        if ($product){
            foreach ($product as $key=>$value){
                if ((int)$value['mark_id'] == $id){
                    unset($product[$key]);
                }
            }
        }
        unset($cart[$id]);

        session()->put('product', $product);
        session()->put('cart', $cart);
    }

    public function addProduct($id)
    {
        $product = Product::find($id);
        if(!$product) {abort(404);}
        $cart = session()->get('product');
        if(!$cart) { $cart = [ $id => [
            "id"=>$id,
            "mark_id"=>Product::find($id)->mark_id
        ] ]; }
        else{ $cart[$id] = [
            "id"=>$id,
            "mark_id"=>Product::find($id)->mark_id
        ]; }
        session()->put('product', $cart);
    }

    public function removeProduct($id)
    {
        $cart = session()->get('product');
        unset($cart[$id]);
        session()->put('product', $cart);
    }

    public function addClient()
    {
        Client::create([
            'name' => $this->client_name,
            'description' => $this->client_description,
            'type' => $this->client_type,
        ]);
    }

}
