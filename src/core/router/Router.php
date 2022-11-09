<?php

require_once 'Route.php';

class Router {

	private string $url;
	private string $lang = DEFAULT_LANGUAGE;
	private array $routes = [];

	public function __construct(string $url) {
		$url = trim($url, '/');

		$parts = explode('/', $url);
		
		if (isset($parts[0]) && in_array($parts[0], LANGUAGES)) {
			$this->lang = $parts[0];
			$this->url = substr($url, strlen($this->lang));
			$_SESSION['lang'] = $this->lang;
		} else {
			if (isset($_SESSION['lang']) && in_array($_SESSION['lang'], LANGUAGES)) {
				$this->lang = $_SESSION['lang'];
			} else {
				$_SESSION['lang'] = $this->lang;
			}
			$this->url = $url;
		}
		
		require_once PATH_LANGUAGES . $this->lang . '.php';
	}

	public function getLang(): string {
		return $this->lang;
	}

	public function get(string $path, string $callable): Route {
		return $this->add('GET', $path, $callable);
	}

	public function post(string $path, string $callable): Route {
		return $this->add('POST', $path, $callable);
	}

	public function put(string $path, string $callable): Route {
		return $this->add('PUT', $path, $callable);
	}

	public function delete(string $path, string $callable): Route {
		return $this->add('DELETE', $path, $callable);
	}

	private function add(string $method, string $path, string $callable): Route {
		$route = new Route($path, $callable);

		$this->routes[$method][$callable] = $route;

		return $route;
	}

	public function run(): void {
		$method = $_SERVER['REQUEST_METHOD'];
		
		if (!isset($this->routes[$method])) {
			$this->error(405);
		}

		foreach ($this->routes[$method] as $route) {
			if ($route->match($this->url)) {
				$route->call($this->lang, $this->routes);
				return;
			}
		}

		$this->error(404);
	}

	private function error(int $code = 500): void {
		http_response_code($code);
		
		require_once PATH_CONTROLLERS . 'ErrorController.php';
		$controller = new ErrorController($this->lang, $this->routes);
		$controller->index($code);
		exit();
	}

}