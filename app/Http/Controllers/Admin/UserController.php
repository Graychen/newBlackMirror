<?php

namespace App\Http\Controllers\Admin;

use App\User;
use Validator;
use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\ThrottlesLogins;
use Illuminate\Foundation\Auth\AuthenticatesAndRegistersUsers;
class UserController extends Controller
{
	protected $guard = 'admin';
	protected $redirectPath ='/profile';

	public function __construct(){
		$this->middleware('auth');
	}

	public function profile(Request $request){
		$user = $request->user();
		echo $user['name'].'登录成功！';
	}
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
	public function getRegister(){
		return view('admin/register');
	}
	/**
	 * 注册过程
	 * @return [type] [description]
	 */
	public function postRegister(){

	}
}