<?php

function redirect(Route $route, array $params = []): void {
	$url = $route->getUrl($params);
	http_response_code(302);
	header("Location: $url");
	exit();
}