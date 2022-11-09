<?php

require_once PATH_CORE . 'Controller.php';

class ErrorController extends Controller {
	
	public function index(int $code): void {
		
		$title_const = 'ERROR_' . $code . '_WINDOW_TITLE';
		$message_const = 'ERROR_' . $code . '_MESSAGE';
		
		$data['title'] = defined($title_const)
			? constant($title_const)
			: ERROR_DEFAULT_WINDOW_TITLE;
		
		$data['message'] = defined($message_const)
			? constant($message_const)
			: ERROR_DEFAULT_MESSAGE;
		
		$data['stylesheets'][] = 'pages/error';
		
		$this->view('error/error', $data);
	}

}