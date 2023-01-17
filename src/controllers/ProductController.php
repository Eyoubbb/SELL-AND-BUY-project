<?php

require_once PATH_CORE . 'Controller.php';

class ProductController extends Controller {

	public function index($id): void {

		$data['stylesheets'][] = 'pages/product';

		$model = $this->model('Product');

		$res = $model->product($id);

		if ($res !== false) {
			$data = array_merge($data, $res);

			$data['title'] = $res['product']->getName();
		} else {
			$data['error'] = $model->getError();
			$data['stylesheets'][] = 'pages/error';

			$this->view('error/errorNoProduct', $data);

		}

		$this->view('product/product', $data);
	}

	public function new(): void {

		if (!isLoggedIn()) {
			redirect($this->getRoutes()['GET:User#login']);
		}

		if (!isCreator()) {
			redirect($this->getRoutes()['GET:Home#index']);
		}

		if ($_SERVER['REQUEST_METHOD'] === 'POST' && !empty($_POST['name']) && !empty($_POST['category_id']) && !empty($_POST['price']) && !empty($_POST['description_fr']) && !empty($_POST['description_en']) && isset($_FILES['image'])) {

			$model = $this->model('Product');

			$res = $model->saveNew();

			if ($res !== false) {
				redirect($this->getRoutes()['GET:Product#index'], ['id' => $res['product']->getId()]);
			}

			$data['error'] = $model->getError();
		}

		$data['stylesheets'][] = 'pages/new-edit-product';

		$data['title'] = PRODUCT_NEW_TITLE;

		$model = $this->model('Product');

		$res = $model->productForm();

		if ($res !== false) {
			$data = array_merge($data, $res);
		} else {
			$data['error'] = $model->getError();
		}

		$this->view('product/new', $data);
	}

	public function edit(int $id): void {

		if (!isLoggedIn()) {
			redirect($this->getRoutes()['GET:User#login']->getUrl());
		}

		if (!isCreator()) {
			redirect($this->getRoutes()['GET:Home#index']->getUrl());
		}

		if ($_SERVER['REQUEST_METHOD'] === 'POST' && !empty($_POST['name']) && !empty($_POST['category_id']) && !empty($_POST['price']) && !empty($_POST['description_fr']) && !empty($_POST['description_en'])) {

			$model = $this->model('Product');

			$res = $model->edit($id);

			if ($res !== false) {
				redirect($this->getRoutes()['GET:Product#index'], ['id' => $res['product']->getId()]);
			}

			$data['error'] = $model->getError();
		}

		$data['stylesheets'][] = 'pages/new-edit-product';

		$data['title'] = PRODUCT_EDIT_TITLE;

		$model = $this->model('Product');

		$res = $model->productForm($id);

		if ($res !== false) {
			$data = array_merge($data, $res);
		} else {
			$data['error'] = $model->getError();
		}

		$this->view('product/edit', $data);
	}

	public function delete(int $id): void {

		if (!isLoggedIn()) {
			redirect($this->getRoutes()['GET:User#login']->getUrl());
		}

		if (!isCreator()) {
			redirect($this->getRoutes()['GET:Home#index']->getUrl());
		}

		$model = $this->model('Product');

		$res = $model->delete($id);

		if ($res !== false) {
			redirect($this->getRoutes()['GET:Home#index']);
		} else {
			redirect($this->getRoutes()['GET:Product#index'], ['id' => $id]);
		}
	}

}