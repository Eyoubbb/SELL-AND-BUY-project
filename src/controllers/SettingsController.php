<?php

require_once PATH_CORE . 'Controller.php';

class SettingsController extends Controller {
	
	public function index(): void {

		$data['title'] = SETTINGS_TITLE;
		$data['stylesheets'][] = 'pages/settings/settings';
		$data['header'] = true;
		$data['footer'] = true;
		$this->view('settings/settings', $data);

	}

	public function security(): void {

		if(!isLoggedIn()) {
			redirect($this->getRoutes()['GET:User#login']);
		}

		if ($_SERVER['REQUEST_METHOD'] === 'POST') {
			$userModel = $this->model('User');
			$res = $userModel->updateSecurity();

			if(!$res) {
				$data['error'] = $userModel->getError();
			}
		}

		$data['title'] = SETTINGS_SECURITY_TITLE;
		$data['stylesheets'][] = 'pages/settings/security';
		$data['header'] = true;
		$data['footer'] = true;
		$this->view('settings/security', $data);

	}
}