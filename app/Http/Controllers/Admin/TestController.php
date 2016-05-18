<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Repositories\Criteria\AdminUser\LoginNumOverZero;
use App\Repositories\AdminUserRepository as AdminUser;

class TestController extends Controller
{
	private $adminUser;

	public function __construct(AdminUser $adminUser){
		$this->adminUser = $adminUser;
	}

	public function index(){
		return view('layouts/child');
	}

	public function testAdmin(){
		return \Response::json($this->adminUser->all());
	}

	public function overZero(){
		$this->adminUser->pushCriteria(new LoginNumOverZero());
		return \Response::json($this->adminUser->all());
	}
}
