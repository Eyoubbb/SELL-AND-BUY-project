<?php

class Category {

	private int $id;
	private string $name;
	private string $description;

	public function getId(): int { return $this->id; }

	public function getName(): string { return $this->name; }

	public function getDescription(): string { return $this->description; }
	
}