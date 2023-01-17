<?php
	$securityUrl = $data['routes']['GET:Settings#security']->getUrl();
	$helpUrl = $data['routes']['GET:Settings#help']->getUrl();
	$serviceClientUrl = $data['routes']['GET:Info#clientSupport']->getUrl();
?>

<?php require(PATH_COMPONENTS . 'nav-header.php'); ?>

<section class="settings">
	<div class="types">
		<a class="settings-type" href="<?= $securityUrl ?>">
			<img src="<?= PATH_IMAGES . 'security.png' ?>" alt="security">
			<div>
				<p class="type-title"><?= SETTINGS_SECURITY_TITLE ?></p>
				<p class="guide"><?= SETTINGS_SECURITY_GUIDE ?></p>
			</div>
        </a>
		<a class="help-type" href="<?= $helpUrl ?>">
			<img src="<?= PATH_IMAGES . 'questions.svg' ?>" alt="help">
			<div>
				<p class="type-title"><?= SETTINGS_HELP_TITLE ?></p>
				<p class="guide"><?= SETTINGS_HELP_GUIDE ?></p>
			</div>
        </a>
	</div>
</section>