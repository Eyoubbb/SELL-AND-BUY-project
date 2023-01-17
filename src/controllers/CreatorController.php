<?php

require_once PATH_CORE . 'Controller.php';

class CreatorController extends Controller {

	public function index($id): void {
		
		$data['stylesheets'][] = 'pages/profile';
		
		$creatorModel = $this->model('Creator');

		$res = $creatorModel->profile($id);

		if ($res !== false) {
			$data = array_merge($data, $res);

			$data['title'] = $res['creator']->getFullName();
		} else {
			$data['error'] = $creatorModel->getError();
			$data['stylesheets'][] = 'pages/error';

			$this->view('error/errorNoCreator', $data);
		}
		
		$this->view('creator/profile', $data);
	}

	public function ask(): void {

		if (!isLoggedIn()) {
			redirect($this->getRoutes()['GET:User#login']);
		}

		if ($_SERVER['REQUEST_METHOD'] === 'POST' && !empty($_POST['description'])) {
			
			$userModel = $this->model('User');

			$data['error'] = $userModel->getError();
		}

		$data['header'] = true;
		$data['footer'] = true;
		
		$data['stylesheets'][] = 'pages/ask';

		$data['scripts'][] = [
			'name' => 'askMultistep',
			'attr' => 'defer'
		];
		
		$this->view('creator/ask', $data);
	}

}