<?php

require_once PATH_CORE . 'DAO.php';
require_once PATH_ENTITIES . 'User.php';
require_once PATH_ENTITIES . 'Admin.php';
require_once PATH_ENTITIES . 'Creator.php';

class UserDAO extends DAO {

	public function __construct() {
		parent::__construct('users');
	}

	public function findByEmail(string $email): User | false {

		$sql = "SELECT *
				FROM {$this->getTable()} U
				LEFT JOIN admins A
					ON (U.user_id = A.admin_id)
				LEFT JOIN creators C
					ON (U.user_id = C.creator_id)
				WHERE U.user_email = ?";

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

	public function insertUser(User $user): string | false {
		return $this->insert([
			'user_first_name' => $user->getFirstName(),
			'user_last_name' => $user->getLastName(),
			'user_password_hash' => $user->getPasswordHash(),
			'user_email' => $user->getEmail(),
			'user_picture_url' => $user->getPictureUrl()
		], false);
	}

	public function updatePictureUrl(User $user): bool {
		return $this->update(['user_id' => $user->getId()], ['user_picture_url' => $user->getPictureUrl()]);
	}

	public function updateFirstName(User $user): bool {
		return $this->update(['user_id' => $user->getId()], ['user_first_name' => $user->getFirstName()]);
	}

	public function updateLastName(User $user): bool {
		return $this->update(['user_id' => $user->getId()], ['user_last_name' => $user->getLastName()]);
	}

	public function updateEmail(User $user): bool {
		return $this->update(['user_id' => $user->getId()], ['user_email' => $user->getEmail()]);
	}

	public function updatePasswordHash(User $user): bool {
		return $this->update(['user_id' => $user->getId()], ['user_password_hash' => $user->getPasswordHash()]);
	}

}