<?php

class SocialMedia {

	private int $user_id;
    private int $social_media_id;
    private string $social_media_account;

	public function __construct(?array $row = null) {
		if ($row) {
            $this->user_id = $row['user_id'];
            $this->social_media_id = $row['social_media_id'];
            $this->social_media_account = $row['social_media_account'];
		}
	}
	
    public function getUserId(): int { return $this->user_id; }

    public function getSocialMediaId(): int { return $this->social_media_id; }

    public function getSocialMediaAccount(): string { return $this->social_media_account; }

    public function setUserId(int $user_id): void { $this->user_id = $user_id; }

    public function setSocialMediaId(int $social_media_id): void { $this->social_media_id = $social_media_id; }

    public function setSocialMediaAccount(string $social_media_account): void { $this->social_media_account = $social_media_account; }
}