<?php

require_once PATH_CORE . 'Model.php';
require_once PATH_ENTITIES . 'Ticket.php';
require_once PATH_ENTITIES . 'TicketType.php';
require_once PATH_ENTITIES . 'User.php';
require_once PATH_ENTITIES . 'Creator.php';

class TicketModel extends Model {
	public function tickets(): array | false {
		$ticketDAO = $this->dao('Ticket');
		$resTickets = $ticketDAO->findAllTickets();

		if ($resTickets === false) {
			$this->setError('ERROR_FETCHING_TICKETS');
			return false;
		}

		$tickets = [];
		$users = [];
		$admins = [];
		$ticketTypes = [];

		// var_dump($resTickets);

		foreach ($resTickets as $row) {
			$tickets[] = new Ticket($row);

			if (!isset($users[$row['user_id']])) {
				$users[$row['user_id']] = new User($row);
			}

			if (!isset($ticketTypes[$row['ticket_type_id']])) {
				$ticketTypes[$row['ticket_type_id']] = new TicketType($row);
			}
			
			$rowAdmin = [
				'user_id' => $row['admin_id'],
				'user_first_name' => $row['admin_first_name'],
				'user_last_name' => $row['admin_last_name'],
				'user_password_hash' => $row['admin_password_hash'],
				'user_email' => $row['admin_email'],
				'user_picture_url' => $row['admin_picture_url']
			];
			
			if(!isset($admins[$row['admin_id']]))
				$admins[$row['admin_id']] = new Admin($rowAdmin);
		}

		return [
			'tickets' => $tickets,
			'users' => $users,
			'admins' => $admins,
			'ticketTypes' => $ticketTypes
		];
	}

	public function resolve($id) {
		$ticketDAO = $this->dao('Ticket');
		$ticket = new Ticket($ticketDAO->findTicketById($id));

		if (!$ticketDAO->resolveTicket($ticket)) {
			$this->setError('ERROR_RESOLVING_TICKET');
			return false;
		}

		if ($ticket->getTicketTypeId() === 5) {

			$creatorDAO = $this->dao('Creator');
			$creator = new Creator($creatorDAO->findAllTypesCreatorById($ticket->getUserId()));

			if ($creator->getVisible()) {
				$this->setError('ERROR_UNEXPECTED_CREATOR_VISIBILITY');
				return false;
			}

			$res = $creatorDAO->setVisibleCreator($creator->getId(), true);
		}

		return true;
	}

	public function reopen($id) {
		$ticketDAO = $this->dao('Ticket');
		$ticket = new Ticket($ticketDAO->findTicketById($id));

		if (!$ticketDAO->reopenTicket($ticket)) {
			$this->setError('ERROR_REOPENING_TICKET');
			return false;
		}

		if ($ticket->getTicketTypeId() === 5) {
			
			$creatorDAO = $this->dao('Creator');
			$creator = new Creator($creatorDAO->findAllTypesCreatorById($ticket->getUserId()));

			if ($creator->getVisible() === false) {
				$this->setError('ERROR_UNEXPECTED_CREATOR_VISIBILITY');
				return false;
			}

			$res = $creatorDAO->setVisibleCreator($creator->getId(), false);
		}

		return true;
	}

	public function delete($id) {
		$ticketDAO = $this->dao('Ticket');
		$ticket = new Ticket($ticketDAO->findTicketById($id));

		if (!$ticketDAO->deleteTicket($ticket)) {
			$this->setError('ERROR_DELETING_TICKET');
			return false;
		}

		if ($ticket->getTicketTypeId() === 5) {
			
			$creatorDAO = $this->dao('Creator');
			$creator = new Creator($creatorDAO->findAllTypesCreatorById($ticket->getUserId()));

			if ($creator->getVisible() === false) {
				$res = $creatorDAO->deleteCreator($creator->getId());
			}
			
		}

		return true;
	}
}