<?php

namespace App\Http\Controllers\Home;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App;
use TestClass;
use App\Contracts\TestContract;
class TestFacadeController extends Controller
{
	public function __construct(TestContract $test){
		$this->test = $test;
	}

	public function index(){
		TestClass::doSomething();
	}
}
