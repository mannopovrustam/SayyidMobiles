<?php

namespace Modules\Product\Http\Livewire\Product;

use Carbon\Carbon;
use Livewire\Component;
use Modules\Invoice\Entities\Invoice;
use Modules\Invoice\Entities\Order;
use Modules\Mark\Entities\Brand;
use Modules\Mark\Entities\Mark;
use Modules\Mark\Entities\Type;
use Modules\Product\Entities\Product;
use Modules\Stock\Entities\Stock;
use Modules\Stock\Entities\StockMark;

class Data extends Component
{
    public $type, $brand, $name, $residue, $all_products = [], $start, $end, $stock_id, $i = 0, $all_stocks;
    public $data_id = [], $price_type_id = [], $mark_id = [], $main_currency_id = [], $price = [], $currency_id = [], $bonus = [];

    public function mount()
    {
        $this->stock_id = null;
        $this->products();
    }

    public function render()
    {
        return view('product::livewire.product.data', ['stock' => $this->stock_id, 'residues' => $this->residue]);
    }

    public function products()
    {
        $this->all_products = [];
        $this->all_stocks = $this->stock_id ? Stock::where('id', $this->stock_id)->get() : Stock::all();

        $brnd = Brand::where('name', 'like', '%'.$this->brand.'%')->get();

        foreach ($this->all_stocks as $stocks){
            foreach ($stocks->products->groupBy('mark_id') as $item){
                $sm = StockMark::where([['mark_id', $item->first()->mark_id], ['price_type_id', $stocks->price_type_id]])->first();
                $cost = Product::where([['stock_id', $stocks->id], ['mark_id', $item->first()->mark_id], ['order_id', null], ['cost', '!=', null]])->get('cost');
                $average = 0;
                if(!$cost->isEmpty()){
                    $sumArray = [];
                    foreach ($cost as $subArray) { $sumArray[] = (double)$subArray->cost; }
                    $average = array_sum($sumArray)/count($sumArray);
                }
                $markId = $item->first()->mark->id;
                $this->all_products[$this->i]['mark_id'] = $markId;

                $this->data_id[$markId] = $sm ? $sm->id : null;
                $this->price_type_id[$markId] =  $stocks->price_type_id;
                $this->mark_id[$markId] =  $item->first()->mark_id;
                $this->main_currency_id[$markId] =  $stocks->main_currency_id;
                $this->price[$markId] =  $sm ? $sm->price : null;
                $this->bonus[$markId] =  $sm ? $sm->bonus : null;
                $this->currency_id[$markId] =  $stocks->main_currency_id;

                $this->all_products[$this->i]['stocks_name'] = $stocks->name;
                $this->all_products[$this->i]['brand_name'] = $item->first()->mark->brand->name;
                $this->all_products[$this->i]['mark_name'] = $item->first()->mark->name;
                $this->all_products[$this->i]['not_sold'] = $item->where('order_id', null)->count();

                if (!$this->start && !$this->end) {
                    $this->all_products[$this->i]['sold'] = $item->where('order_id', '!=', null)->count();
                }

                if ($this->start){
                    $this->all_products[$this->i]['sold'] = $item->where('order_id', '!=',null)->where('updated_at', '>', $this->start . 'T00:00:00')->count();
                }
                if ($this->end){
                    $this->all_products[$this->i]['sold'] = $item->where('order_id', '!=',null)->where('updated_at', '<', $this->end . 'T23:59:59')->count();
                }

                $this->all_products[$this->i]['stocks_currency'] = currency($stocks->main_currency_id)->currency;
                $this->all_products[$this->i]['price'] = ($sm ? $sm->price : '');
                $this->all_products[$this->i]['average'] = round($average, 2);

                $this->i++;
            }
        }
    }

    public function storeMark($id)
    {
        $sm = StockMark::updateOrCreate(['id' => $this->data_id[$id]], [
            'price_type_id' => $this->price_type_id[$id],
            'currency_id' => $this->main_currency_id[$id],
            'mark_id' => $this->mark_id[$id],
            'price' => $this->price[$id],
            'bonus' => $this->bonus[$id]
        ]);
        $this->data_id[$id] = $sm->id;
    }
}
