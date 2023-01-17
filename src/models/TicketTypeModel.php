<?php

require_once PATH_CORE . 'Model.php';
require_once PATH_ENTITIES . 'TicketTypes.php';

class TicketTypeModel extends Model {

	public function allTypes(): array | false {

		$ticketTypeDAO = $this->dao('TicketTypes');

		$ticketType = $ticketTypeDAO->getAll();

		if ($ticketType === false) {
			$this->setError('ERROR_FECTHING_TICKET');
			return false;
		}

		return $ticketType;
	}
}