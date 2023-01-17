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

	public function help(): void {

		if(!isLoggedIn()) {
			redirect($this->getRoutes()['GET:User#login']);
		}

		$data['title'] = SETTINGS_HELP_TITLE;
		$data['stylesheets'][] = 'pages/settings/help';

		$ticketTypeModel = $this->model('TicketType');

		$data['ticketTypes'] = $ticketTypeModel->allTypes();

		if ($_SERVER['REQUEST_METHOD'] === 'POST' && !empty($_POST['content-request']) && !empty($_POST['name-request'])) {
			$ticketModel = $this->model('Ticket');
			
			$res = $ticketModel->new();

			if(!$res) {
				$data['error'] = $ticketModel->getError();
			}

			redirect($this->getRoutes()['GET:Settings#index']);
		}

		$this->view('settings/help', $data);
	}
}