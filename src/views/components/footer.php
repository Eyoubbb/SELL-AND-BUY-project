<?php
	
	$askCreatorUrl = $data['routes']['GET:Creator#ask']->getUrl();
	$shippingReturn = $data['routes']['GET:Info#shippingReturn']->getUrl();
	$legalNotice = $data['routes']['GET:Info#legalNotice']->getUrl();
	$termsCondition = $data['routes']['GET:Info#termsCondition']->getUrl();
	$contact = $data['routes']['GET:Info#contact']->getUrl();
	$clientSupport = $data['routes']['GET:Info#clientSupport']->getUrl();
?>
<footer>
	<div class="footer-top">
		<ul>
			<li>
				<p><?= PAYMENT ?></p>
			</li>

			<li>
				<a class="hover-link" href="<?= $askCreatorUrl ?>"><?= BECOME_CREATOR ?></a>
			</li>
			<li>
				<a class="hover-link" href="<?= $clientSupport ?>"><?= CUSTOMER_SERVICE ?></a>
			</li>
			<li>
				<span><a class="hover-link" href="<?= $shippingReturn ?>"><?= SHIPPING_RETURN ?></a></span>
			</li>
		</ul>
	</div>
	<div class="footer-bottom">
		<div class="footer-left">
			<ul>
				<li>
					<a class="hover-link" href="<?= $contact ?>">Contact</a>
				</li>
				<li>
					<a class="hover-link" href="<?= $legalNotice ?>"><?= LEGAL_MENTION ?></a>
				</li>
				<li>
					<a class="hover-link" href="<?= $termsCondition ?>"><?= CONDITION_VENTE ?></a>
				</li>
			</ul>
			<p>© SAB 2022. <?= COPYRIGHT ?></p>
		</div>
		<div class="footer-right">
			<form method="POST">
				<label for="newsletter"><?= NEWSLETTER ?></label>
				<input id="newsletter" type="email" name="email" placeholder="<?= EMAIL_ADDRESS ?>" required>
				<button class="submit">OK</button>
			</form>
		</div>
	</div>
</footer>