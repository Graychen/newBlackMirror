<?php

namespace App\Http\Controllers\home;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App;
use App\Contracts\TestContract;
class ServiceController extends Controller
{
	public function __construct(TestContract $test){
		$this->test = $test;
	}

    public function index(){
		$this->test->callMe('TestController');
    }
}
