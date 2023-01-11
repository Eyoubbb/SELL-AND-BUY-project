<?php
	$newPrice = round($product->getPrice() - ($product->getPrice() * $product->getDiscountPercentage() / 100), 0);
	$productURL = $data['routes']['GET:Product#index']->getUrl(['id' => $product->getId()]);
	$delete = $data['routes']['GET:Cart#decreaseQuantity']->getUrl(['id' => $product->getId()]);
    $deleteAllProduct = $data['routes']['GET:Cart#deleteProduct']->getUrl(['id' => $product->getId()]);
	$add = $data['routes']['GET:Cart#increaseQuantity']->getUrl(['id' => $product->getId()]);
	$product_quantity = $data['pdCount'][$product->getId()]['quantity'];
	$total_price = round($newPrice * $product_quantity);
?>
<tr>
	<td>
		<a href="<?= $deleteAllProduct ?>">
			<img src="<?= PATH_IMAGES . 'x.svg' ?>" alt="delete" loading="lazy">
		</a>
	</td>
	<td>
		<a href="<?= $productURL ?>">
			<div class="item-wrapper">
				<img class="img-cart" src="<?= PATH_PRODUCTS . $product->getImageUrl() ?>" alt="img-cart" loading="lazy">
			</div>
		</a>
	</td>
	<td>
		<a class="name" href="<?= $productURL ?>"><?= $product->getName() ?></a>
	</td>
	<td class="arrow-container">
		<a href="<?= $add ?>">
			<img class="arrow" src="<?= PATH_IMAGES . 'up.svg' ?>" alt="delete" loading="lazy">
		</a>
		<p class="quantity"><?= $product_quantity ?></p>
		<a href="<?= $delete ?>">
			<img class="arrow" src="<?= PATH_IMAGES . 'down.svg' ?>" alt="delete" loading="lazy">
		</a>
	</td>
	<td class="price"><?= $newPrice . ' €' ?></td>
	<td class="total"><?= $total_price . ' €' ?></td>
</tr>