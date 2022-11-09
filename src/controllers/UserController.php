<?php

require_once PATH_CORE . 'Controller.php';

class UserController extends Controller {

	public function login(): void {
		
		if (isset($_SESSION['logged_in']) && $_SESSION['logged_in'] === true) {
			redirect($this->getRoutes()['GET:Home#index']);
		}

		if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['email'], $_POST['password'])) {
			
			$userModel = $this->model('User');
			
			$user = $userModel->login();

			if ($user) {
				$_SESSION['logged_in'] = true;
				$_SESSION['user'] = $user;
				
				redirect($this->getRoutes()['GET:Home#index']);
			}

			$data['error'] = $userModel->getError();
		}
		
		$data['title'] = LOGIN_WINDOW_TITLE;
		
		$data['stylesheets'][] = 'pages/login';

		$data['header'] = false;
		$data['footer'] = false;
		
		$data['form'] = 'user/login';
		
		$data['page-title'] = LOGIN_TITLE;
		$data['option-name'] = LOGIN_NEW;
		$data['option-url'] = $this->getRoutes()['GET:User#register']->getUrl();
		$data['option-link'] = LOGIN_SIGNUP;
		
		$this->view('user/login-register', $data);
	}

	public function register(): void {
		
		if (isset($_SESSION['logged_in']) && $_SESSION['logged_in'] === true) {
			redirect($this->getRoutes()['GET:Home#index']);
		}

		if ($_SERVER['REQUEST_METHOD'] === 'POST' && !empty($_POST['email']) && !empty($_POST['password']) && !empty($_POST['password-confirm']) && !empty($_POST['first-name']) && !empty($_POST['last-name']) && isset($_FILES['picture'])) {
			
			$userModel = $this->model('User');
			
			$user = $userModel->register();

			if ($user) {
				$_SESSION['logged_in'] = true;
				$_SESSION['user'] = $user;
				
				redirect($this->getRoutes()['GET:Home#index']);
			}

			$data['error'] = $userModel->getError();
		}
		
		$data['title'] = REGISTER_WINDOW_TITLE;
		
		$data['stylesheets'][] = 'pages/register';

		$data['scripts'][] = [
			'name' => 'multistep',
			'attr' => 'defer'
		];

		$data['header'] = false;
		$data['footer'] = false;

		$data['form'] = 'user/register';
		
		$data['page-title'] = REGISTER_TITLE;
		$data['option-name'] = REGISTER_EXISTING;
		$data['option-url'] = $this->getRoutes()['GET:User#login']->getUrl();
		$data['option-link'] = REGISTER_LOGIN;
		
		$this->view('user/login-register', $data);
	}

}