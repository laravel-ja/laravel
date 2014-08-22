<!DOCTYPE html>
<html lang="en-US">
	<head>
		<meta charset="utf-8">
	</head>
	<body>
		<h2>パスワードリセット</h2>

		<div>
			パスワードをリセットするには、リンク先のフォームを入力してください。: {{ URL::to('password/reset', array($token)) }}.<br/>
			このリンクは、{{ Config::get('auth.reminder.expire', 60) }} 分で無効になります。
		</div>
	</body>
</html>
