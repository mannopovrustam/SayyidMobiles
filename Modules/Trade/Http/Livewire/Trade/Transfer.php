<?php

namespace Modules\Trade\Http\Livewire\Trade;

use Livewire\Component;
use Modules\Mark\Entities\Mark;
use Modules\Product\Entities\Product;
use Modules\Stock\Entities\Stock;

class Transfer extends Component
{

    public $searchTerm, $searchTermData, $stock_id, $products, $product_amount = [];
    public $stocks  = [], $inputsearchstock = '', $stock_id_select;
    public $stocks_to  = [], $inputsearchstock_to = '', $stock_id_select_to;

    public function render()
    {
        $this->stock_id = session()->get('stock');


        if (session()->get('old_invoice') != 1){
            $this->data_id = request()->get('data_id');
        }
        if ($this->data_id && session()->get('old_invoice') != 1){
            $this->old_invoice($this->data_id);
            session()->put('old_invoice', 1);
        }

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

        $searchstocks = [];
        if(strlen($this->inputsearchstock)>=1){
            $searchstocks = Stock::where('name', 'LIKE' , '%'.$this->inputsearchstock.'%')->take(5)->get();
        }

        $searchstocks_to = [];
        if(strlen($this->inputsearchstock_to)>=1){
            $searchstocks_to = Stock::where('name', 'LIKE' , '%'.$this->inputsearchstock_to.'%')->take(5)->get();
        }

        return view('trade::livewire.trade.transfer')->with(['searchstocks' => $searchstocks, 'searchstocks_to' => $searchstocks_to]);
    }
    public function selectstock($stock_id)
    {
        $this->stock_id_select = $stock_id;
        session()->put('stock', $stock_id);
        $this->inputsearchstock='';
        session()->forget('product');
    }
    public function selectstock_to($stock_id)
    {
        $this->stock_id_select_to = $stock_id;
        $this->inputsearchstock_to='';
    }
    public function clearSelectStock()
    {
        $this->stock_id_select = null;
    }
    public function clearSelectStockTo()
    {
        $this->stock_id_select_to = null;
    }

    public function product_by_amount($mark_id)
    {
        $products = Product::where([['mark_id', $mark_id], ['stock_id', session()->get('stock')]])->get()->toArray();
        $array_keys = [];
        foreach (session()->get('product') as $s_pro => $value){
            if ($value['mark_id'] == $mark_id){
                $array_keys[] = $s_pro;
            }
        }

        if ((int)$this->product_amount[$mark_id] <= -count($array_keys) && (int)$this->product_amount[$mark_id] < 0){
            (int)$this->product_amount[$mark_id] = -count($array_keys);
        }
        if ((int)$this->product_amount[$mark_id] >= (count($products)-count($array_keys)) && (int)$this->product_amount[$mark_id] > 0){
            (int)$this->product_amount[$mark_id] = (count($products)-count($array_keys));
        }

        $i = 0; $k = 0;
        if ((int)$this->product_amount[$mark_id] < 0){
            while ($i < -(int)$this->product_amount[$mark_id]) {
                if (in_array($products[$k]['id'], $array_keys)){
                    $this->removeProduct($products[$k]['id']);
                    $i++;
                }
                $k++;
            }
        }else{
            while ($i < (int)$this->product_amount[$mark_id]) {
                if (!in_array($products[$k]['id'], $array_keys)){
                    $this->addCart($products[$k]['mark_id']);
                    $this->addProduct($products[$k]['id']);
                    $i++;
                }
                $k++;
            }
        }
        $this->product_amount[$mark_id] = '';
    }


    public function old_invoice($id)
    {
        $transfer = \Modules\Trade\Entities\Transfer::find($id)->products;
        foreach (explode('|', $transfer) as $item){
            foreach (explode(",", $item) as $value){
                $product = Product::find($value);
                $this->addCart($product->mark_id);
                $this->addProduct($product->id);
            }
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
