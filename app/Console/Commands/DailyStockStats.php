<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Modules\Stock\Entities\Cashbox;

class DailyStockStats extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'stats:daily_stock';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Omborning kunlik hisoboti.';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $quotes = [
            'Salom' => 'Dost',
        ];

        foreach ($quotes as $key => $quote) {
            Cashbox::create([
                'income' => $key,
                'expend' => $key,
            ]);
        }

        $this->info('Successfully sent daily quote to everyone.');
    }
}
