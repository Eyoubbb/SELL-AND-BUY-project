<?php

class Rating {

	private int $id;
	private int $product_id;
	private int $comment_id;
	private int $user_id;
	private int $grade;
	private string $date;

	public function getId(): int { return $this->id; }

	public function getProductId(): int { return $this->product_id; }

	public function getCommentId(): int { return $this->comment_id; }

	public function getUserId(): int { return $this->user_id; }

	public function getGrade(): int { return $this->grade; }
	
	public function getDate(): string { return $this->date; }
	
}