<?php

require_once PATH_CORE . 'DAO.php';
require_once PATH_ENTITIES . 'SocialMediaAccounts.php';

class SocialMediaAccountsDAO extends DAO {

	public function __construct() {
		parent::__construct('socialmediaaccounts');
	}

    public function setMediaAccount(int $creator_id, int $media_id, string $media_account) {
        $sql = "INSERT INTO {$this->getTable()} (user_id, social_media_id, social_media_account)
                VALUES (?, ?, ?)";

        return $this->rowCount($sql, [$creator_id, $media_id, $media_account]);
    }

    public function removeAllAccounts(int $creator_id) {
        $sql = "DELETE FROM {$this->getTable()}
                WHERE user_id = ?";

        return $this->rowCount($sql, [$creator_id]);
    }
	
}