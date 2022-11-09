<?php

class Route {

	private string $path;
	private string $callable;
	private array $matches = [];
	private array $params = [];

	public function __construct(string $path, string $callable) {
		$this->path = trim($path, '/');
		$this->callable = $callable;
	}

	public function getUrl(array $params = []): string {
		$path = $this->path;

		foreach ($params as $k => $v) {
			$path = str_replace(":$k", $v, $path);
		}

		return "/$path";
	}

	public function with(string $param, string $regex): self {
		$this->params[$param] = str_replace('(', '(?:', $regex);
		return $this;
	}

	public function match(string $url): bool {
		$url = trim($url, '/');
		$path = preg_replace_callback('#:([\w]+)#', [$this, 'paramMatch'], $this->path);
		$regex = "#^$path$#";
		
		if (!preg_match($regex, $url, $matches)) {
			return false;
		}

		array_shift($matches);
		$this->matches = $matches;
		return true;
	}
	
	private function paramMatch(array $match): string {
		if (isset($this->params[$match[1]])) {
			return '(' . $this->params[$match[1]] . ')';
		}
		return '([^/]+)';
	}

	public function call(string $lang, array $routes): void {
		$params = explode('#', $this->callable);
		$controllerName = "$params[0]Controller";

		require_once PATH_CONTROLLERS . $controllerName . '.php';

		$controller = new $controllerName($lang, $routes);
		
		call_user_func_array([$controller, $params[1]], $this->matches);
	}

}