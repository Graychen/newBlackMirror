<?php

namespace App\Http\Controllers\Admin;

use App\User;
use Validator;
use App\Http\Controllers\Controller;
class UserController extends Controller
{

	/**
	 * 显示登录
	 * @return [type] [description]
	 */
	public function index(){

	}

	/**
	 * 登陆页面
	 * @return [type] [description]
	 */
	public function getLogin(){
		return view('admin/login');
	}
	/**
	 * 登录验证
	 * @return [type] [description]
	 */
	public function postLogin(){}
	/**
	 * 退出登陆
	 * @return [type] [description]
	 */
	public function getLogout(){}
	/**
	 * 注册页面
	 * @return [type] [description]
	 */
	public function getRegister(){}
	/**
	 * 注册过程
	 * @return [type] [description]
	 */
	public function postRegister(){}
}