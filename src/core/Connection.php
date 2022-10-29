<?php

class Connection {

	private static $instance = null;

	private $bdd = null;

	private function __construct() {
		$this->bdd = new PDO('mysql:host='.DB_HOST.'; dbname='.DB_NAME.'; charset=utf8', DB_USER, DB_PWD);
		$this->bdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	}

	public function __clone(): void {}

	public function __wakeup(): void {}

	public static function getInstance(): self {
		if (self::$instance === null) {
			self::$instance = new self();
		}
		return self::$instance;
	}

	public function getBdd(): PDO {
		return $this->bdd;
	}

}