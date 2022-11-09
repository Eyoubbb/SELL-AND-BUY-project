<?php

class Ticket {

	private int $id;
	private int $user_id;
	private int $ticket_type_id;
	private int $admin_id;
	private string $name;
	private string $description;
	private string $date;
	private bool $resolved;

	public function getId(): int { return $this->id; }

	public function getUserId(): int { return $this->user_id; }
	
	public function getTicketTypeId(): int { return $this->ticket_type_id; }

	public function getAdminId(): int { return $this->admin_id; }

	public function getName(): string { return $this->name; }

	public function getDescription(): string { return $this->description; }

	public function getDate(): string { return $this->date; }

	public function getResolved(): bool { return $this->resolved; }
	
}