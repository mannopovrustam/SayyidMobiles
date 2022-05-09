<?php

namespace Modules\Trade\Http\Livewire\Trade;

use Illuminate\Support\Facades\Session;
use Livewire\Component;
use Modules\Currency\Entities\Currency;
use Modules\Invoice\Entities\Invoice;
use Modules\Invoice\Entities\Order;
use Modules\Mark\Entities\Mark;
use Modules\Product\Entities\Product;
use Modules\Stock\Entities\Stock;
use Modules\Trade\Http\Traits\Orders;

class Cash extends Component
{
    public $modalFormVisible = true;
    public  $searchTerm,
            $searchTermData,
            $stock_id,
            $stock,
            $products,
            $price,
            $priceResults,
            $mark_price,
            $discount = 0,
            $data_id,
            $order,

            $summ,
            $second_currency,
            $main_currency,
            $main_currency_pay,
            $second_currency_pay,
            $remainder,
            $sum_currency_pay_get,
            $currency_second;

    public $second_currency_pay_1 = [];
    public $stocks  = [], $inputsearchstock = '', $stock_id_select;

    public function mount(){
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

        if(Stock::find($this->stock_id)) {
            $this->main_currency = Currency::find(Stock::find($this->stock_id)->main_currency_id);
            $this->second_currency = Currency::find(Stock::find($this->stock_id)->second_currency_id);
        }

        $this->order();
        $this->productSearch();

        if(session()->get('product')){
            if (session()->get('mark_price')){
                $this->price();
            }
        }

        $this->summ = $this->summ - (int)$this->discount;

        if($this->discount){
            $this->remainder = (double)$this->remainder - (double)$this->discount;
        }

        if($this->main_currency_pay){
            $this->remainder = (double)$this->remainder - (double)$this->main_currency_pay;
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

        return view('trade::livewire.trade.cash')->with(['searchstocks' => $searchstocks]);
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
            $this->discount = $item->discount;
        }
        $invoice = Invoice::find($id);
        $this->main_currency_pay = sum($invoice->sum_id)->main_currency_pay;
        foreach (explode("|", sum($invoice->sum_id)->second_currency_id) as $key => $item){
            $this->second_currency_pay_1[$item] = explode("|", sum($invoice->sum_id)->second_currency_pay)[$key];
        }
//            $this->summ = $this->summ - $this->discount;
        $this->remainder = $this->summ;
//        $this->calculate();
    }

//    public function submit(){
//        $this->calculate();
//    }

//    public function calculate(){
//        $this->main_currency_payF();
//        $this->second_currency_payF();
//    }

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
        $this->remainder = $this->summ;
    }

//    public function main_currency_payF(){
//        $this->remainder = $this->summ - ($this->main_currency_pay ? $this->main_currency_pay : 0);
//        if($this->main_currency){
//            $this->second_currency_pay = change_currency($this->second_currency_pay, $this->main_currency->id, $this->second_currency->id);
//        }
//    }
//    public function second_currency_payF(){
//        $this->main_currency_pay = $this->summ - change_currency($this->second_currency_pay, $this->second_currency->id, $this->main_currency->id);
//    }
//    public function discountF(){
//        $this->main_currency_payF();
//        $this->second_currency_payF();
//    }

    public function openProductsModal()
    {
        if ($this->modalFormVisible){
            $this->modalFormVisible = false;
        }else{
            $this->modalFormVisible = true;
        }
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
}
