<?php

require_once PATH_CORE . 'DAO.php';
require_once PATH_ENTITIES . 'Creator.php';
require_once PATH_ENTITIES . 'User.php';

class CreatorDAO extends DAO {

	public function __construct() {
		parent::__construct('creators');
	}

	public function getAllCreators(): array | false {
		$sql = "SELECT *
				FROM {$this->getTable()} C
				JOIN users U
					ON C.creator_id = U.user_id
				WHERE creator_visible is not false";
		
		return $this->queryAll($sql, [], false);
	}

	public function findCreatorById($id) {
		$sql = "SELECT *
				FROM {$this->getTable()} C
				JOIN users U
					ON C.creator_id = U.user_id
				WHERE creator_id = ? and creator_visible is not false";
		
		return $this->queryRow($sql, [$id], false);
	}

	public function findAllTypesCreatorById($id) {
		$sql = "SELECT *
				FROM {$this->getTable()} C
				JOIN users U
					ON C.creator_id = U.user_id
				WHERE creator_id = ?";
		
		return $this->queryRow($sql, [$id], false);
	}

	public function insertCreator(Creator $creator) {
		return $this->insert([
            'creator_id' => $creator->getId(),
            'creator_description' => $creator->getDescription(),
            'creator_banner_url' => $creator->getBannerUrl(),
			'creator_visible' => $creator->getVisible()  ? 1 : 0
        ]);
	}

	public function setVisibleCreator(int $creator_id, bool $visibility) {
		$sql = "UPDATE {$this->getTable()} SET creator_visible = ?
				WHERE creator_id = ?";
		return $this->rowCount($sql, [$visibility, $creator_id]);
	}

	public function deleteCreator(int $creator_id) {
		return $this->delete(['creator_id' => $creator_id]);
	}

	public function getBestCategory(int $creator_id) {
		$sql = "SELECT category_name, COUNT(*) AS nb
				FROM {$this->getTable()} C
				JOIN products P
					ON C.creator_id = P.product_creator_id
				JOIN categories CT
					ON P.product_category_id = CT.category_id
				WHERE creator_visible is not false and creator_id = ?
				GROUP BY category_id
				ORDER BY nb DESC
				LIMIT 1";
		return $this->queryRow($sql, [$creator_id], false);
	}
	
}