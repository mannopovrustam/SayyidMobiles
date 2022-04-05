<?php

namespace Modules\Trade\Http\Livewire\Trade;

use Livewire\Component;
use Modules\Mark\Entities\Mark;
use Modules\Product\Entities\Product;

class Transfer extends Component
{

    public $searchTerm, $searchTermData, $stock_id, $products;

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

        return view('trade::livewire.trade.transfer');
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
