<?php

namespace App\Http\Controllers\Home;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Repositories\GoodsRepository as Goods;
class TestController extends Controller
{
    protected $goods;
    public function __construct(Goods $goods){
        $this->goods=$goods;
    }

   public function index(){
       dd($this->goods->all());
   }
}
