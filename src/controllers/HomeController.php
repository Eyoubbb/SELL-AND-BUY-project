<?php

require_once PATH_CORE . 'Controller.php';

class HomeController extends Controller {

	public function index(): void {
		
		$data['title'] = HOME_WINDOW_TITLE;
		
		$data['stylesheets'][] = 'pages/home';
		
		$this->view('home/home', $data);
	}

}