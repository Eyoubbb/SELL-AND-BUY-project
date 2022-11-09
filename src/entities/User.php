<?php

class User {

	private int $id;
	private string $first_name;
	private string $last_name;
	private string $password_hash;
	private string $email;
	private ?string $picture_url;
	
	public function __construct(?array $row = null) {
		if ($row) {
			$this->id = $row['id'];
			$this->first_name = $row['first_name'];
			$this->last_name = $row['last_name'];
			$this->password_hash = $row['password_hash'];
			$this->email = $row['email'];
			$this->picture_url = $row['picture_url'];
		}
	}
	
	public function getId(): int { return $this->id; }

	public function setId(int $id): void { $this->id = $id; }

	public function getFirstName(): string { return $this->first_name; }

	public function setFirstName(string $first_name): void { $this->first_name = $first_name; }

	public function getLastName(): string { return $this->last_name; }

	public function setLastName(string $last_name): void { $this->last_name = $last_name; }

	public function getPasswordHash(): string { return $this->password_hash; }

	public function setPasswordHash(string $password_hash): void { $this->password_hash = $password_hash; }

	public function getEmail(): string { return $this->email; }

	public function setEmail(string $email): void { $this->email = $email; }

	public function getPictureUrl(): ?string { return $this->picture_url; }
	
	public function setPictureUrl(string $picture_url): void { $this->picture_url = $picture_url; }

}