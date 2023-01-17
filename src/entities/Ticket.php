<?php

class Ticket {

	private int $ticket_id;
	private int $ticket_user_id;
	private int $ticket_ticket_type_id;
	private int $ticket_admin_id;
	private string $ticket_name;
	private string $ticket_description;
	private string $ticket_date;
	private bool $ticket_resolved;

	public function __construct(?array $row = null) {
		if ($row) {
			$this->ticket_id = $row['ticket_id'];
			$this->ticket_user_id = $row['ticket_user_id'];
			$this->ticket_ticket_type_id = $row['ticket_ticket_type_id'];
			$this->ticket_admin_id = $row['ticket_admin_id'];
			$this->ticket_name = $row['ticket_name'];
			$this->ticket_description = $row['ticket_description'];
			$this->ticket_date = $row['ticket_date'];
			$this->ticket_resolved = $row['ticket_resolved'];
		}
	}
	
	public function getId(): int { return $this->ticket_id; }

	public function getUserId(): int { return $this->ticket_user_id; }
	
	public function getTicketTypeId(): int { return $this->ticket_ticket_type_id; }

	public function getAdminId(): int { return $this->ticket_admin_id; }

	public function getName(): string { return $this->ticket_name; }

	public function getDescription(): string { return $this->ticket_description; }

	public function getDate(): string { return $this->ticket_date; }

	public function getResolved(): bool { return $this->ticket_resolved; }

	public function setResolved(bool $resolved): void { $this->ticket_resolved = $resolved; }

	public function setUserId(int $user_id): void { $this->ticket_user_id = $user_id; }

	public function setTicketTypeId(int $ticket_type_id): void { $this->ticket_ticket_type_id = $ticket_type_id; }

	public function setAdminId(int $admin_id): void { $this->ticket_admin_id = $admin_id; }

	public function setDate(string $date): void { $this->ticket_date = $date; }

	public function setName(string $name): void { $this->ticket_name = $name; }

	public function setDescription(string $description): void { $this->ticket_description = $description; }
	
}