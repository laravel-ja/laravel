<?php

use Illuminate\Auth\UserTrait;
use Illuminate\Auth\UserInterface;
use Illuminate\Auth\Reminders\RemindableTrait;
use Illuminate\Auth\Reminders\RemindableInterface;

class User extends Eloquent implements UserInterface, RemindableInterface {

	use UserTrait, RemindableTrait;

	/**
	 * モデルで使用されるデータベース
	 *
	 * @var string
	 */
	protected $table = 'users';

	/**
	 * モデルのJSON形式に含めない項目
	 *
	 * @var array
	 */
	protected $hidden = array('password', 'remember_token');

}
