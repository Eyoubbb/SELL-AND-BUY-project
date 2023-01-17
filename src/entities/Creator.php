<?php

require_once 'User.php';

class Creator extends User {

	private string $creator_description;
	private ?string $creator_banner_url;
	private bool $creator_visible;

	public function __construct(?array $row = null) {
		if ($row) {
			parent::__construct($row);
			$this->creator_description = $row['creator_description'];
			$this->creator_banner_url = $row['creator_banner_url'];
			$this->creator_visible = $row['creator_visible'];
		}
	}

	public function getDescription(): string { return $this->creator_description; }

	public function setDescription(string $description): void { $this->creator_description = $description; }

	public function getBannerUrl(): ?string { return $this->creator_banner_url; }

	public function setBannerUrl(string $banner_url): void { $this->creator_banner_url = $banner_url; }

	public function getVisible(): bool { return $this->creator_visible; }

	public function setVisible(bool $visibility): void { $this->creator_visible = $visibility; }
	
}