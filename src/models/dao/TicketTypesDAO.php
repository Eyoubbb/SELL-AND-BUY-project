<?php

require_once PATH_CORE . 'DAO.php';
require_once PATH_ENTITIES . 'TicketTypes.php';

class TicketTypesDAO extends DAO {

	public function __construct() {
		parent::__construct('tickettypes');
	}

    public function getAll() {
        $sql = "SELECT *
                FROM {$this->getTable()}";

        return $this->queryAll($sql, null, false);
    }

}