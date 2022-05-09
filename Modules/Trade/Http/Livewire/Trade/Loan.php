<?php

namespace Modules\Trade\Http\Livewire\Trade;

use \Modules\Client\Entities\Client;
use Modules\Invoice\Entities\Invoice;
use Modules\Invoice\Entities\Order;
use \Modules\Mark\Entities\Mark;
use \Modules\Product\Entities\Product;
use Livewire\Component;
use Modules\Stock\Entities\Stock;
use Modules\Trade\Http\Traits\Currency;
use Modules\Trade\Http\Traits\Orders;

class Loan extends Component
{

    public $modalFormVisible = true;
    public $searchTerm, $searchTermData, $stock_id, $products, $summ = 0, $summ_agree = 0, $price_agree = 0, $stock;
    public $main_currency_pay, $second_currency_pay, $price, $priceResults, $main_currency, $second_currency, $mark_price, $discount = 0, $order;
    public $client_name, $client_description, $client_type;
    public $data_id, $price_agree_1;
    public $remainder, $remainder_second;
    public $second_currency_pay_1 = [];
    public $stocks  = [], $inputsearchstock = '', $stock_id_select;

    public function mount()
    {
        $this->stock_id = session()->get('stock');
        $this->stock = Stock::find($this->stock_id);
        foreach (explode("|", $this->stock->second_currency_id) as $item){
            $this->second_currency_pay_1[$item] = 0;
        }
    }
    public function render()
    {
        $this->stock_id = session()->get('stock');
        $this->stock = Stock::find($this->stock_id);

        if(\Modules\Stock\Entities\Stock::find($this->stock_id)){
            $this->main_currency = \Modules\Currency\Entities\Currency::find(\Modules\Stock\Entities\Stock::find($this->stock_id)->main_currency_id);
            $this->second_currency = \Modules\Currency\Entities\Currency::find(\Modules\Stock\Entities\Stock::find($this->stock_id)->second_currency_id);
        }

        $this->order();
        $this->productSearch();

        if(session()->get('product')){
            if (session()->get('mark_price')){
                $this->price();
            }
//            $this->summ = (int)$this->summ - (int)$this->discount;
        }
        $this->summ = $this->summ - (double)$this->discount;
        $this->remainder = $this->summ;
        if($this->main_currency_pay){
            $this->remainder = (double)$this->remainder - (double)$this->remainder_second - (double)$this->main_currency_pay;
        }
        if($this->second_currency_pay_1 != null){
            foreach($this->second_currency_pay_1 as $key => $value){
                $this->remainder = $this->remainder - (double)$value/(double)currency($key)->rate;
            }
        }
        $this->sum_currency_pay_get = round($this->summ - $this->remainder, 5);

        $searchstocks = [];
        if(strlen($this->inputsearchstock)>=1){
            $searchstocks = Stock::where('name', 'LIKE' , '%'.$this->inputsearchstock.'%')->take(5)->get();
        }

        return view('trade::livewire.trade.loan')->with(['searchstocks' => $searchstocks]);
    }
    public function selectstock($stock_id)
    {
        $this->stock_id_select = $stock_id;
        session()->put('stock', $stock_id);
        $this->inputsearchstock='';
    }
    public function clearSelectStock()
    {
        $this->stock_id_select = null;
    }

//    public function calculate(){
//        $this->price();
//        $this->main_currency_payF();
//        $this->second_currency_payF();
//    }

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
            $this->main_currency_pay = $item->main_currency_pay;
//            $this->second_currency_pay = $item->second_currency_pay;
            $this->remainder_second = $item->order_detail->first()->price_agreement;
            $this->second_currency_rate = $item->second_currency_rate;
            $this->discount = $item->discount;
            $this->summ = $this->summ - (double)$this->discount;
        }
        $invoice = Invoice::find($id);
        $this->main_currency_pay = sum($invoice->sum_id)->main_currency_pay;
        foreach (explode("|", sum($invoice->sum_id)->second_currency_id) as $key => $item){
            $this->second_currency_pay_1[$item] = explode("|", sum($invoice->sum_id)->second_currency_pay)[$key];
        }


//        $this->calculate();
    }

    public function price()
    {
        $this->mark_price = 0;
        $this->summ = 0;

        session()->put('mark_price', $this->priceResults);
        if (session()->get('mark_price') && session()->get('product')){
            foreach(session()->get('product') as $key => $value){
                foreach (session()->get('mark_price') as $item => $item2){
                    if ($value['mark_id'] == $item){
                        $this->summ += (int)$item2;
                    }
                }
            }
        }
        $this->summ = $this->summ*(float)\Modules\Currency\Entities\Currency::find($this->main_currency->id)->rate;
    }
//    public function main_currency_payF(){
//        $usdM = 1/(double)\Modules\Currency\Entities\Currency::find($this->main_currency->id)->rate;
//        $crr = (double)\Modules\Currency\Entities\Currency::find($this->second_currency->id)->rate;
//
//        $usd = 1/(double)\Modules\Currency\Entities\Currency::find($this->second_currency->id)->rate;
//        $crrM = (double)\Modules\Currency\Entities\Currency::find($this->main_currency->id)->rate;
//
//        $this->summ_agree = 0;
//        $this->price_agree = 0;
//
//        $this->summ_agree =  number_format($this->second_currency_pay*$usd*$crrM, 1, '.', '') + $this->main_currency_pay;
//        $this->price_agree = $this->summ - $this->summ_agree;
//
//    }
//    public function second_currency_payF(){
//        $usd = 1/(double)\Modules\Currency\Entities\Currency::find($this->second_currency->id)->rate;
//        $crrM = (double)\Modules\Currency\Entities\Currency::find($this->main_currency->id)->rate;
//        $this->summ_agree = 0;
//        $this->price_agree = 0;
//
//        $this->summ_agree = (int)$this->main_currency_pay + (int)number_format($this->second_currency_pay*$usd*$crrM, 1, '.', '');
//        $this->price_agree = $this->summ - $this->summ_agree;
//    }
//    public function discountF(){
//        $this->main_currency_payF();
//        $this->second_currency_payF();
//    }

//    public function openProductsModal()
//    {
//        $this->modalFormVisible = true;
//    }

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
        $this->client_name = null;
        $this->client_description = null;
        $this->client_type = null;
    }
}
