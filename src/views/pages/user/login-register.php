<?php
	$homeUrl = $data['routes']['GET:Home#index']->getUrl();
?>
<main>
	<aside class="wrapper-presentation">
		<div class="description">
			<a href="<?= $homeUrl ?>">
				<img src="<?= PATH_IMAGES . 'logo.svg' ?>" alt="<?= ALT_LOGO ?>" loading="lazy">
			</a>
			<p><?= LOGIN_REGISTER_PRESENTATION ?></p>
		</div>
		<div class="container-image">
			<img src="<?= PATH_IMAGES . 'presentation.svg' ?>" alt="<?= LOGIN_REGISTER_ALT_PRESENTATION ?>" loading="lazy">
		</div>
	</aside>
	<section class="wrapper-form">
		<div class="title">
			<span><?= LOGIN_REGISTER_BACK_TO ?><a href="<?= $homeUrl ?>"><?= LOGIN_REGISTER_HOME ?></a></span>
			<h1><?= $data['page-title'] ?></h1>
			<span><?= $data['option-name'] ?> <a href="<?= $data['option-url'] ?>"><?= $data['option-link'] ?></a></span>
		</div>
		<?php
			require_once PATH_PAGES . $data['form'] . '.php';
		?>
	</section>
</main>