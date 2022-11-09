<?php

require_once 'User.php';

class Creator extends User {

	private string $description;
	private ?string $banner_url;

	public function __construct(?array $row = null) {
		if ($row) {
			parent::__construct($row);
			$this->description = $row['description'];
			$this->banner_url = $row['banner_url'];
		}
	}

	public function getDescription(): string { return $this->description; }

	public function getBannerUrl(): ?string { return $this->banner_url; }
	
}