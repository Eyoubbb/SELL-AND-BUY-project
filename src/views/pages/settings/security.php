
<?php 
	$user = unserialize($_SESSION['user']);

	require(PATH_COMPONENTS . 'nav-header.php'); 
?>

<form method="POST" <?= isset($enctype) ? 'enctype="' . $enctype . '"' : "" ?>>
	<section class="security">
		<div class="main-container container">
			<div class="main-title">
				<h1><?= SETTINGS_SECURITY_MAIN_TITLE ?></h1>
				<p><?= SETTINGS_SECURITY_MAIN_SUBTITLE ?></p>
			</div>
			<div class="main-body">
				<div class="wrapper">
					<h1><?= SETTINGS_FIRST_NAME ?></h1>
					<input class="text-box" type="text" name="first-name" placeholder="<?= $user->getFirstName(); ?>" >
				</div>
				<div class="wrapper">
					<h1><?= SETTINGS_LAST_NAME ?></h1>
					<input class="text-box" type="text" name="last-name" placeholder="<?= $user->getLastName(); ?>">
				</div>	
				<div class="wrapper">
					<h1><?= SETTINGS_EMAIL ?></h1>
					<input class="text-box" type="text" name="email" placeholder="<?= $user->getEmail(); ?>">
				</div>
				<div class="wrapper">
					<h1><?= SETTINGS_PASSWORD ?></h1>
					<input class="text-box" type="password" name="password" placeholder="<?= SETTINGS_DUMMY_PASSWORD ?>">
				</div>
			</div>
		</div>
		<input class="save" type="submit" value="<?= SETTINGS_SAVE ?>">
	</section>
</form>