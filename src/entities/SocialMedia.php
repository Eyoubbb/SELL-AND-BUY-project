<?php

class SocialMedia {

	private int $id;
	private string $name;
	private ?string $icon_url;

	public function getId(): int { return $this->id; }

	public function getName(): string { return $this->name; }

	public function getIconUrl(): ?string { return $this->icon_url; }
	
}