<?php namespace App\Repositories\Criteria\AdminUser;

use Bosnadev\Repositories\Criteria\Criteria;
use Bosnadev\Repositories\Contracts\RepositoryInterface as Repository;

class LoginNumOverZero extends Criteria{
	public function apply($model,Repository $repository){
		$model = $model->where('login_num','>',0);
		return $model;
	}
}