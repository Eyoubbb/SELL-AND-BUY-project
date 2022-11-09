<?php

abstract class Controller {

	private string $lang;
	private array $routes;
	
	public function __construct(string $lang, array $routerMap) {
		$this->lang = $lang;

		foreach ($routerMap as $method => $routes) {	
			foreach ($routes as $name => $route) {
				$key = $method . ':' . $name;

				$this->routes[$key] = $route;
			}
		}
	}

	public function getRoutes(): array {
		return $this->routes;
	}
	
	public function model(string $model): object {

		$modelName = $model . 'Model';
		
		require_once PATH_MODELS . $modelName . '.php';

		return new $modelName();
	}

	public function view(string $view, array $data = []): void {

		$data['view'] = $view;
		$data['lang'] = $this->lang;
		$data['routes'] = $this->routes;

		require_once PATH_VIEWS . 'default.php';
	}

}