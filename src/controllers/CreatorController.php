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
		if (isCreator() || isUnverifiedCreator()) {
			redirect($this->getRoutes()['GET:Home#index']);
		}

		if ($_SERVER['REQUEST_METHOD'] === 'POST' && !empty($_POST['description'])) {

			$creatorModel = $this->model('Creator');
			
			$res = $creatorModel->ask();

			if ($res !== false) {
				redirect($this->getRoutes()['GET:User#logout']);
			}

			$data['error'] = $model->getError();
		}
		
		$data['title'] = "Creator - Ask";

		$data['stylesheets'][] = 'pages/ask';

		$data['scripts'][] = [
			'name' => 'askMultistep',
			'attr' => 'defer'
		];
		
		$this->view('creator/ask', $data);
	}

	public function discover(): void {

		$data['title'] = "Creators - Discover";
		
		$data['stylesheets'][] = 'pages/discover';

		$data['scripts'][] = [
			'name' => 'fixElementUp',
			'attr' => 'defer'
		];

		$creatorModel = $this->model('Creator');

		$res = $creatorModel->discover();

		if ($res !== false) {
			$data = array_merge($data, $res);
		} else {
			$data['error'] = $creatorModel->getError();
		}

		$this->view('creator/discover', $data);
	}

}