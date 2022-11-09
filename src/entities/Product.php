<?php

class Product {
	
	private int $id;
	private string $category_id;
	private int $creator_id;
	private string $name;
	private string $description;
	private ?string $image_url;
	private float $price;
	private float $discount_percentage;
	private int $stock;
	private bool $visible;
	
	public function getId(): int { return $this->id; }

	public function getCategoryId(): string { return $this->category_id; }
	
	public function getCreatorId(): int { return $this->creator_id; }

	public function getName(): string { return $this->name; }
	
	public function getDescription(): string { return $this->description; }
	
	public function getImageUrl(): ?string { return $this->image_url; }
	
	public function getPrice(): float { return $this->price; }
	
	public function getDiscountPercentage(): float { return $this->discount_percentage; }
	
	public function getStock(): int { return $this->stock; }
	
	public function getVisible(): bool { return $this->visible; }
	
}