<?php

require_once PATH_CORE . 'DAO.php';
require_once PATH_ENTITIES . 'Ticket.php';

class TicketDAO extends DAO {

	public function __construct() {
		parent::__construct('tickets');
	}

	public function findAllTickets() {
		$sql = "SELECT 
					A.user_id AS admin_id,
					A.user_first_name AS admin_first_name, 
					A.user_last_name AS admin_last_name,
					A.user_password_hash AS admin_password_hash,
					A.user_email AS admin_email,
					A.user_picture_url AS admin_picture_url, 
					U.user_id AS user_id,
					U.user_first_name AS user_first_name, 
					U.user_last_name AS user_last_name,
					U.user_password_hash AS user_password_hash,
					U.user_email AS user_email,
					U.user_picture_url AS user_picture_url, 
					TT.*,
					T.*
				FROM {$this->getTable()} T
				JOIN users A
					ON (T.ticket_admin_id = A.user_id)
				JOIN users U
					ON (T.ticket_user_id = U.user_id)
				JOIN tickettypes TT
					ON (T.ticket_ticket_type_id = TT.ticket_type_id)";

		return $this->queryAll($sql, null, false);
	}

	public function findTicketById($ticketId) {
		$sql = "SELECT *
		FROM {$this->getTable()} T
		WHERE
			T.ticket_id = ?";

		return $this->queryRow($sql, [$ticketId], false);
	}

	public function resolveTicket(Ticket $ticket) {
		return $this->update(['ticket_id' => $ticket->getId()], ['ticket_resolved' => 1]);
	}

	public function reopenTicket(Ticket $ticket) {
		return $this->update(['ticket_id' => $ticket->getId()], ['ticket_resolved' => 0]);
	}

	public function deleteTicket(Ticket $ticket) {
		return $this->delete(['ticket_id' => $ticket->getId()]);
	}

	public function createTicket(Ticket $ticket) {
		
		return $this->insert([
			'ticket_user_id' => $ticket->getUserId(),
			'ticket_admin_id' => $ticket->getAdminId(),
			'ticket_ticket_type_id' => $ticket->getTicketTypeId(),
			'ticket_date' => $ticket->getdate(),
			'ticket_description' => $ticket->getDescription(),
			'ticket_name' => $ticket->getName(),
			'ticket_resolved' => $ticket->getResolved()  ? 1 : 0
		]);
	}
}
