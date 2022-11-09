<?php

class Model {

	private string $error;
	
	public function getError(): string {
		return $this->error;
	}

	public function setError(string $error): void {
		$this->error = $error;
	}

	public function dao(string $dao): object {
		
		$daoName = $dao . 'DAO';
		
		require_once PATH_DAO . $daoName . '.php';

		return new $daoName();
	}
	
}