<?php

use Illuminate\Auth\UserInterface;
use Illuminate\Auth\Reminders\RemindableInterface;

class User extends Eloquent implements UserInterface, RemindableInterface {

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
	protected $hidden = array('password');

	/**
	 * ユーザーのユニークな識別子の取得.
	 *
	 * @return mixed
	 */
	public function getAuthIdentifier()
	{
		return $this->getKey();
	}

	/**
	 * ユーザーのパスワードの取得
	 *
	 * @return string
	 */
	public function getAuthPassword()
	{
		return $this->password;
	}

	/**
	 * "Remember me"セッションのトークン値取得
	 *
	 * @return string
	 */
	public function getRememberToken()
	{
		return $this->remember_token;
	}

	/**
	 * "Remember me"セッションのトークン値設定
	 *
	 * @param  string  $value
	 * @return void
	 */
	public function setRememberToken($value)
	{
		$this->remember_token = $value;
	}

	/**
	 * "Remember me"トークンのカラム名取得
	 *
	 * @return string
	 */
	public function getRememberTokenName()
	{
		return 'remember_token';
	}

	/**
	 * パスワードリマインダーを送信するメールアドレスの取得
	 *
	 * @return string
	 */
	public function getReminderEmail()
	{
		return $this->email;
	}

}
