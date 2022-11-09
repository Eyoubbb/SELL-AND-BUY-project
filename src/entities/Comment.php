<?php

class Comment {

	private int $id;
	private int $rating_id;
	private int $user_id;
	private string $title;
	private string $body;

	public function getId(): int { return $this->id; }

	public function getRatingId(): int { return $this->rating_id; }

	public function getUserId(): int { return $this->user_id; }

	public function getTitle(): string { return $this->title; }

	public function getBody(): string { return $this->body; }

}