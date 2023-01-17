<?php

require_once PATH_CORE . 'Model.php';
require_once PATH_ENTITIES . 'Ticket.php';
require_once PATH_ENTITIES . 'TicketTypes.php';
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
				$ticketTypes[$row['ticket_type_id']] = new TicketTypes($row);
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

			$res = $creatorDAO->setVisibleCreator($creator->getId(), 1);
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

			$res = $creatorDAO->setVisibleCreator($creator->getId(), 0);
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

			if ($creator->getVisible() == 0) {

				$fileName = $creator->getPictureUrl();

				if (file_exists(PATH_UPLOAD_CREATOR_BANNERS . $fileName)) {
					unlink(PATH_UPLOAD_CREATOR_BANNERS . $fileName);
				}

				$socialMediaAccountsDAO = $this->dao('SocialMediaAccounts');
				$res = $socialMediaAccountsDAO->removeAllAccounts($creator->getId());

				$resDelete = $creatorDAO->deleteCreator($creator->getId());


			}
			
		}

		return true;
	}

	public function new() {
		[
			'subject' => $subject,
			'name-request' => $nameRequest,
			'content-request' => $contentRequest,
		] = $_POST;

		$user = unserialize($_SESSION['user']);

		$adminDAO = $this->dao('Admin');
		
		$res = $adminDAO->getAllAdmins();

		if ($res === false) {
			$this->setError('ERROR_FETCHING_ADMINS');
			return false;
		}

		$randomAdmin = rand(0, count($res) - 1);
		$dt = time();

		$ticketDAO = $this->dao('Ticket');

		$ticket = new Ticket();
		$ticket->setUserId($user->getId());
		$ticket->setName($nameRequest);
		$ticket->setDescription($contentRequest);
		$ticket->setTicketTypeId($subject);
		$ticket->setAdminId($res[$randomAdmin]['admin_id']);
		$ticket->setDate(date('Y-m-d', $dt));
		$ticket->setResolved(0);

		$resTicket = $ticketDAO->createTicket($ticket);

		if ($resTicket === false) {
			$this->setError('ERROR_CREATING_TICKET');
			return false;
		}

		return true;
	}
}