<?php
	$creator = $data['creator'];
	$socialMedias = $data['socialMedias'];
	$products = $data['products'];
?>
<img class="banner" src="<?= PATH_CREATORS . $creator->getBannerUrl() ?>" alt="<?= ALT_BANNIERE ?>">
<section class="profile-container">
	<div class="blockpp">
		<img class="profilepic" src="<?= PATH_USERS . $creator->getPictureUrl() ?>" alt="<?= ALT_PROFILE_PICTURE_CREATOR ?>">
		<span class="name"><?= $creator->getFullName() ?></span>
	</div>
	<div class="texte">
		<h1><?= ABOUT ?></h1>
		<p><?= $creator->getDescription() ?></p>
		<ul>
			<?php
				foreach ($socialMedias as $socialMedia) {
					$url = PATH_SOCIAL_MEDIAS . $socialMedia->getIconUrl();
					echo <<<HTML
						<li>
							<a href="{$socialMedia->getPrefix()}{$socialMedia->getAccount()}" target="_blank" title="{$socialMedia->getName()}">
								<img src="$url" alt="{$socialMedia->getName()}'s icon">
							</a>
						</li>
					HTML;
				}
			?>
		</ul>
		<div class="subscribe">
			<button type="button"><?= SUBSCRIBE ?></button>
		</div>
	</div>
</section>
<section class="products-container">
	<h2>Mes produits :</h2>
	<div class="products-wrapper">
		<?php
			foreach ($products as $product) {
				require PATH_COMPONENTS . 'product.php';
			}
		?>
	</div>
</section>