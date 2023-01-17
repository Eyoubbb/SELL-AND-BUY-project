<!DOCTYPE html>
<html lang="<?= $data['lang'] ?>">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link rel="apple-touch-icon" sizes="180x180" href="<?= PATH_FAVICON ?>apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="32x32" href="<?= PATH_FAVICON ?>favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="<?= PATH_FAVICON ?>favicon-16x16.png">
	<link rel="manifest" href="<?= PATH_FAVICON ?>site.webmanifest">
	<link rel="mask-icon" href="<?= PATH_FAVICON ?>safari-pinned-tab.svg" color="#000000">
	<link rel="shortcut icon" href="<?= PATH_FAVICON ?>favicon.ico">
	<meta name="apple-mobile-web-app-title" content="Sell &amp; Buy">
	<meta name="application-name" content="Sell &amp; Buy">
	<meta name="msapplication-TileColor" content="#ffffff">
	<meta name="msapplication-config" content="<?= PATH_FAVICON ?>browserconfig.xml">
	<meta name="theme-color" content="#ffffff">
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&family=Open+Sans:wght@400;700&family=Source+Code+Pro:wght@400;700&display=swap" rel="stylesheet">

	<?php
		if (!(isset($data['header']) && $data['header'] === false)) {
			$path = PATH_JS . 'header.js';
			echo "<script src=\"$path\" defer></script>";
		}

		if (isset($data['stylesheets'])) {
			foreach ($data['stylesheets'] as $stylesheet) {
				
				$path = PATH_CSS . $stylesheet . '.css';
				
				echo "<link rel=\"stylesheet\" href=\"$path\">";
			}
		}

		if (isset($data['scripts'])) {
			foreach ($data['scripts'] as $script) {
				
				$path = PATH_JS . $script['name'] . '.js';
				$attr = $script['attr'] ?? '';
				
				echo "<script src=\"$path\" $attr></script>";
			}
		}
	?>

	<title><?= isset($data['title']) ? $data['title'] . ' - ' : '' ?>Sell &amp; Buy</title>
</head>
<body>
	<?php
		if (!(isset($data['header']) && $data['header'] === false)) {
			require_once PATH_COMPONENTS . 'header.php';
		}

		echo '<main>';
		
		if (isset($data['error']) && $data['error'] != 'INVALID_EMAIL' && $data['error'] !='INVALID_PASSWORD' && $data['error'] !='ERROR_FETCHING_PRODUCT' && $data['error'] !='ERROR_CREATOR_NOT_FOUND') {
			echo "<div class=\"error\">$data[error]</div>";
		} else {
			require_once PATH_PAGES . $data['view'] . '.php';
		}
		
		


		echo '</main>';

		if (!(isset($data['footer']) && $data['footer'] === false)) {
			require_once PATH_COMPONENTS . 'footer.php';
		}
	?>
</body>
</html>