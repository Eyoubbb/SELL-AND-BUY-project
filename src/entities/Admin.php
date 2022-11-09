<?php

require_once 'User.php';

class Admin extends User {
	
	public function __construct(?array $row = null) {
		if ($row) {
			parent::__construct($row);
		}
	}

}