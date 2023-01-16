<?php

class TicketTypes {

	private int $ticket_type_id;
	private string $ticket_type_name;

	public function __construct(?array $row = null) {
		if ($row) {
			$this->ticket_type_id = $row['ticket_type_id'];
			$this->ticket_type_name = $row['ticket_type_name'];
		}
	}
	
	public function getId(): int { return $this->ticket_type_id; }

	public function getName(): string { return $this->ticket_type_name; }
	
}