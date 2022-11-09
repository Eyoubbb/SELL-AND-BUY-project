<?php

class Tag {

	private int $id;
	private int $tag_category_id;
	private string $name;

	public function getId(): int { return $this->id; }

	public function getTagCategoryId(): int { return $this->tag_category_id; }
	
	public function getName(): string { return $this->name; }
	
}