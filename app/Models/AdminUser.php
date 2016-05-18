<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AdminUser extends Model
{
	protected $pirmaryKey = 'id';

	protected $table = 'admin_user';

	protected $casts = [
		"rental_rate"   => 'float'
		];
}
