<?php
namespace App\Repositories;
use App\Models\Goods as Goods;
class GoodsRepository extends Repository{
    function model(){
        return Goods;
    }
}