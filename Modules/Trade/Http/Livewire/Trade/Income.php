<?php

namespace Modules\Trade\Http\Livewire\Trade;

use Livewire\Component;
use Modules\Invoice\Entities\Expense;
use Modules\Mark\Entities\Mark;
use Modules\Product\Entities\Product;
use Modules\Product\Entities\Shipment;
use Modules\Trade\Http\Traits\Orders;

class Income extends Component
{

    public $modalFormVisible = true;
    public $searchTerm, $main_currency, $searchTermData, $stock_id, $products, $quantity = [], $price = [], $summ = [], $summ_single = [], $x_summ = [], $x_summ_single = [], $old_inputs = [], $inputs = [], $imei, $i = 1, $k = 1;
    public $x_name = [], $x_price = [], $x_type = [], $x_note = [], $x_mark = [], $x_distribute = [];
    public $note, $data_id;

    public function render()
    {
        $this->stock_id = session()->get('stock');

        if(\Modules\Stock\Entities\Stock::find($this->stock_id)){
            $this->main_currency = \Modules\Currency\Entities\Currency::find(\Modules\Stock\Entities\Stock::find($this->stock_id)->main_currency_id);
            $this->second_currency = \Modules\Currency\Entities\Currency::find(\Modules\Stock\Entities\Stock::find($this->stock_id)->second_currency_id);
        }

        if (session()->get('old_invoice') != 1){
            $this->data_id = request()->get('data_id');
        }
        if ($this->data_id && session()->get('old_invoice') != 1){
            session()->put('old_invoice', 1);
            $this->old_invoice($this->data_id);
        }
        $this->stock_id = session()->get('stock');

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

        return view('trade::livewire.trade.income');
    }

    public function old_invoice($id)
    {
        $expence = Expense::where('invoice_id', $id)->get();
        for ($m = 0; $m < count($expence); $m++){
            $this->i = $m;
            array_push($this->old_inputs, $m);
            $this->x_name[$m] = $expence[$m]['name'];
            $this->x_price[$m] = $expence[$m]['main_currency_pay'];
            $this->x_type[$m] = $expence[$m]['type'];
            $this->x_note[$m] = $expence[$m]['note'];
            $this->x_mark[$m] = explode(',', $expence[$m]['mark_id']);
            $this->x_distribute[$m] = $expence[$m]['distribute'];
        }
        foreach (Shipment::where('invoice_id', $id)->get() as $item){
            $this->quantity[$item->mark_id] = $item->quantity;
            $this->price[$item->mark_id] = $item->price;
            $this->addCart($item->mark_id);
            foreach (Product::where('shipment_id', $item->id)->get() as $val){
                $im = [];
                if ($val->imei) {
                    if (session()->get('imei')){
                        $im = session()->get('imei');
                    }
                    $im[$item->mark_id][$val->imei] = ['id' => $val->imei];
                    session()->put('imei', $im);
                    $this->imei[$item->mark_id] = null;
                }
            }
        }
        $this->calculate();
    }

    public function calculate()
    {

        $mark_price = [];
        $quantity = 1;
        $type3 = 0;
        foreach ($this->x_mark as $mark_x => $mark){
            $foiz = 0;
            $quantity = 0;
            $price = [];
            switch ($this->x_type[$mark_x]) {
                case '1':
                    foreach ($mark as $m_x){
                        (int)$quantity += $this->quantity[(int)$m_x];
                        $price[] = $this->price[$m_x]*$this->quantity[$m_x];
                    }
                    foreach ($mark as $m_x){
                        if (!array_key_exists($m_x, $mark_price)){ $mark_price[$m_x] = 0; }
                        $mark_price[$m_x] += ($this->x_price ? (int)$this->x_price[$mark_x] : 0)/$quantity;
                    }
                    break;
                case '2':
                    foreach ($mark as $m_x){
                        if (!array_key_exists($m_x, $mark_price)){ $mark_price[$m_x] = 0; }
                        $mark_price[$m_x] += $this->x_price[$mark_x];
                    }
                    break;
                case '3':
                    foreach ($mark as $m_x){
                        if (!array_key_exists($m_x, $mark_price)){ $mark_price[$m_x] = 0; }
//                        dd($this->x_price[$mark_x]);
                        $mark_price[$m_x] += ($this->price[$m_x]*$this->quantity[$m_x]*$this->x_price[$mark_x]/100/$this->quantity[$m_x]);
                    }
                    break;
                case '4':
                    foreach ($mark as $m_x){
                        $price[] = $this->price[$m_x]*$this->quantity[$m_x];
                    }
                    foreach ($mark as $m_x){
                        if (!array_key_exists($m_x, $mark_price)){ $mark_price[$m_x] = 0; }
                        $foiz = ($this->price[$m_x]*$this->quantity[$m_x])/(array_sum($price));
                        $mark_price[$m_x] += ($foiz*$this->x_price[$mark_x])/$this->quantity[$m_x];
                    }
                    break;
            }

        }

        foreach ($this->price as $key => $value){
            if (isset($mark_price[$key])){
                $this->summ[$key] = ($mark_price[$key]+$value)*$this->quantity[$key];
                $this->x_summ[$key] = $mark_price[$key]*$this->quantity[$key];
                $this->summ_single[$key] = ($mark_price[$key]+$value);
            }else{
                $mark_price[$key] = 0;
                $this->summ[$key] = ($mark_price[$key]+$value)*$this->quantity[$key];
                $this->x_summ[$key] = $mark_price[$key]*$this->quantity[$key];
                $this->summ_single[$key] = ($mark_price[$key]+$value);
            }
        }

    }

    public function add($i)
    {
        $this->i = $i + 1;
        $this->inputs[(int)$this->i] = $this->i;
    }

    public function remove($i)
    {
        unset($this->inputs[$i]);
        unset($this->old_inputs[$i]);
        unset($this->x_name[$i]);
        unset($this->x_price[$i]);
        unset($this->x_type[$i]);
        unset($this->x_note[$i]);
        unset($this->x_mark[$i]);
        unset($this->x_distribute[$i]);
    }

    private function resetInputFields()
    {
        $this->x_name = '';
        $this->x_price = '';
        $this->x_type = '';
        $this->x_note = '';
        $this->x_mark = '';
        $this->x_distribute = '';
    }

    public function addCart($id)
    {
        $product = Mark::find($id);
        if (!$product) {
            abort(404);
        }
        $cart = session()->get('cart');
        if (!$cart) {
            $cart = [$id => ["id" => $id]];
        } else {
            $cart[$id] = ["id" => $id];
        }
        $this->searchTerm = null;
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

        if ($product) {
            foreach ($product as $key => $value) {
                if ((int)$value['mark_id'] == $id) {
                    unset($product[$key]);
                }
            }
        }
        unset($cart[$id]);

        session()->put('product', $product);
        session()->put('cart', $cart);
    }

    public function addImei($markId)
    {
        $im = array();
        if ( $this->imei && $this->imei[$markId]) {
            if (session()->get('imei')){
                $im = session()->get('imei');
            }
            $im[$markId][$this->imei[$markId]] = ['id' => $this->imei[$markId]];
            session()->put('imei', $im);
            $this->imei[$markId] = null;
        }
    }

    public function removeImei($markId, $text)
    {
        $ime = session()->get('imei');
        unset($ime[$markId][$text]);
        session()->put('imei', $ime);
    }

    public function removeImeiMark($markId)
    {
        $ime = session()->get('imei');
        unset($ime[$markId]);
        session()->put('imei', $ime);
    }
}
