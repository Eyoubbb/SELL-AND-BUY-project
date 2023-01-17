<?php
if (isset($data['error']) && $data['error'] === 'ERROR_FETCHING_PRODUCT') {
	echo '<div class= "error"><span>' . PRODUCTUCT_INVALID . '</span> </div>';
}else{
	$product = $data['product'];
	$creator = $data['creator'];
	$loginUrl = $data['routes']['GET:User#login']->getUrl();
	$creatorUrl = $data['routes']['GET:Creator#index']->getUrl(['id' => $creator->getId()]);
	$addToCartUrl = $data['routes']['GET:Cart#increaseQuantity']->getUrl(['id' => $product->getId()]);
	$cartUrl = $data['routes']['GET:Product#index']->getUrl(['id' => $product->getId()]); // either dynamic url or query string
	$editUrl = $data['routes']['GET:Product#edit']->getUrl(['id' => $product->getId()]);
	$deleteUrl = $data['routes']['GET:Product#delete']->getUrl(['id' => $product->getId()]);
}

?>
<section class="product">
	<div class="generalImage">
		<div class="secondimage">
			<div><img src="<?= PATH_PRODUCTS . $product->getImageUrl() ?>"></div>
			<div><img src="<?= PATH_PRODUCTS . $product->getImageUrl() ?>"></div>
			<div><img src="<?= PATH_PRODUCTS . $product->getImageUrl() ?>"></div>
		</div>
		<div class="firstimage">
			<!-- images du produit   -->
			<img src="<?= PATH_PRODUCTS . $product->getImageUrl() ?>">
		</div>
	</div>
	<div class="information">
		<!-- coté gauche, description du produit   -->
		<h1><?= $product->getName() ?></h1>
		<?php
			if ($product->getDiscountPercentage() > 0) {
				$newPrice = round($product->getPrice() - ($product->getPrice() * $product->getDiscountPercentage() / 100), 0);

				echo <<<HTML
					<p>
						<del>{$product->getPrice()} €</del>
					</p>
					<p>
						$newPrice €
					</p>
				HTML;
			} else {
				echo "<p>{$product->getPrice()} €</p>";
			}
		?>
		<div class="diferentestyleimage">
			<!-- images du produit en plus petit   -->
			<img src="<?= PATH_PRODUCTS . $product->getImageUrl() ?>">
			<img src="<?= PATH_PRODUCTS . $product->getImageUrl() ?>">

		</div>
		<p class="description">
			<!-- texte du produit    -->
			<?php
				$lang = $data['lang'];
				switch($lang) {
					case 'fr' :
						echo $product->getDescriptionFr();
						break;

					case 'en' :
						echo $product->getDescriptionEn();
						break;

					default :
						echo $product->getDescriptionFr();
				}
			?>


		<div class="links">
			<a href="<?= $creatorUrl ?>" title="See the creator">
				<img src="<?= PATH_IMAGES . 'user.svg' ?>">
				<?= $creator->getFullName() ?>
			</a>
			<a href="<?= isLoggedIn() ? $addToCartUrl : $loginUrl ?>" title="Add to cart">
				<img src="<?= PATH_IMAGES . 'cart.svg' ?>">
				<?= PRODUCT_ADD_TO_CART ?>
			</a>
			<?php if (isProductOwner($creator->getId())) { ?>
				<a href="<?= $editUrl ?>" title="Edit">
					<img src="<?= PATH_IMAGES . 'edit.svg' ?>">
					<?= PRODUCT_EDIT ?>
				</a>
				<a href="<?= $deleteUrl ?>" title="Delete">
					<img src="<?= PATH_IMAGES . 'trash.svg' ?>">
					<?= PRODUCT_DELETE ?>
				</a>
			<?php } ?>
		</div>
	</div>
</section>

<section class="similar-products">
	<h2><?= PRODUCT_SIMILAR_ARTICLES ?> :</h2>
	<div class="similar-products-wrapper">
		<?php
			foreach ($data['similarProducts'] as $product) {

				$creator = $data['users'][$product->getCreatorId()];

				require PATH_COMPONENTS . 'product.php';
			}
		?>
	</div>
</section>

<?php
	$nbRating = count($data['ratings']);
	if ($nbRating !== 0) {
?>
<section class="clientreview ">
	<div class="commentstitle">
		<h2><?= $nbRating . ' ' . PRODUCT_CLIENT_OPINION . ($nbRating > 1 ? 's' : '') ?> :</h2>
		<div class="mark">
			<?php
				if ($nbRating !== 0) {
					$grades = array_map(fn ($rating) => $rating->getGrade(), $data['ratings']);

					$avgRating = array_sum($grades) / $nbRating;
					$avgRating = round($avgRating);

					for ($i = 0; $i < 5; $i++) {
						echo '<img src="' . PATH_IMAGES . 'star.png" ' . ($i <= $avgRating - 1 ? 'class="starvalid"' : '') . ' />';
					}
				}
			?>
		</div>
	</div>
	<div class="comments">
		<?php
			foreach ($data['ratings'] as $rating) {
				if ($rating->getCommentId() !== null) {
					$comment = $data['comments'][$rating->getCommentId()];
					$user = $data['users'][$rating->getUserId()];

					echo <<<HTML
						<article class="comment">
							<h3>{$comment->getTitle()}</h3>
							<div class="commenthead">
								<div class="mark">
					HTML;

					for ($i = 0; $i < 5; $i++) {
						echo '<img src="' . PATH_IMAGES . 'star.png" ' . ($i <= $rating->getGrade() - 1 ? 'class="starvalid"' : '') . ' />';
					}

					$dateTime = new DateTime($rating->getDate());

					$dateFormatter = new IntlDateFormatter(
						$data['lang'] === 'fr' ? 'fr_FR' : 'en_US',
						IntlDateFormatter::FULL,
						IntlDateFormatter::FULL,
						$data['lang'] === 'fr' ? 'Europe/Paris' : 'UTC',
						IntlDateFormatter::GREGORIAN,
						$data['lang'] === 'fr' ? 'd MMMM y' : 'MMMM d, y'
					);

					$by = PRODUCT_BY;

					echo <<<HTML
								</div>
								<p class="author">{$by} {$user->getFirstName()} {$user->getLastName()} : {$dateFormatter->format($dateTime)}</p>
							</div>
							<p class="commentdescription">{$comment->getBody()}</p>
						</article>
					HTML;
				}
			}
		?>
	</div>
</section>
<?php
	}