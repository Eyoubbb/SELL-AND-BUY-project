<?php

require_once PATH_CORE . 'DAO.php';
require_once PATH_ENTITIES . 'User.php';
require_once PATH_ENTITIES . 'Admin.php';
require_once PATH_ENTITIES . 'Creator.php';

class UserDAO extends DAO {

	public function __construct() {
		parent::__construct('users');
	}

	public function getByEmail(string $email): User | false {
		
		$sql = 'SELECT * FROM ' . $this->getTable() . ' LEFT JOIN admins A ON (id = A.ADMIN_ID) LEFT JOIN creators C ON (id = C.CREATOR_ID) WHERE email = ?';
		
		$row = $this->queryRow($sql, [$email], false);
		
		switch (true) {
			case !$row:
				return false;
			
			case $row['admin_id']:
				return new Admin($row);
			
			case $row['creator_id']:
				return new Creator($row);
				
			default:
				return new User($row);
		}
	}
	
}