<?php

function isLoggedIn(): bool {
	return isset($_SESSION['logged_in']) && $_SESSION['logged_in'] === true;
}

function isCreator(): bool {
	return isset($_SESSION['user']) && unserialize($_SESSION['user']) instanceof Creator && unserialize($_SESSION['user'])->getVisible() == 1;
}

function isUnverifiedCreator(): bool {
	return isset($_SESSION['user']) && unserialize($_SESSION['user']) instanceof Creator && unserialize($_SESSION['user'])->getVisible() == 0;
}

function isAdmin(): bool {
	return isset($_SESSION['user']) && unserialize($_SESSION['user']) instanceof Admin;
}

function isProductOwner(int $id): bool {
	return isLoggedIn() && isCreator() && unserialize($_SESSION['user'])->getId() === $id;
}