<?php

function createCookie(string $name, string $value, int $expire = 31_536_000, bool $httpOnly = true): bool {

	$secure = !empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off';

	return setcookie(
		$name,
		$value,
		time() + $expire,
		'/',
		$_SERVER['SERVER_NAME'],
		$secure,
		$httpOnly
	);
}