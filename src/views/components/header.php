<?php
	$frUrl = '/fr' . $data['url'];
	$enUrl = '/en' . $data['url'];
	$homeUrl = $data['routes']['GET:Home#index']->getUrl();
	$loginUrl = $data['routes']['GET:User#login']->getUrl();
	$registerUrl = $data['routes']['GET:User#register']->getUrl();
	$logoutUrl = $data['routes']['GET:User#logout']->getUrl();
	$searchUrl = $data['routes']['GET:Home#index']->getUrl();
	$settingsUrl = $data['routes']['GET:Home#index']->getUrl();
	$askCreatorUrl = $data['routes']['GET:Creator#ask']->getUrl();
	$carturl = $data['routes']['GET:Cart#cart']->getUrl();
	$newProductUrl = $data['routes']['GET:Product#new']->getUrl();
	$supportUrl = $data['routes']['GET:Admin#support']->getUrl();

	if (isLoggedIn()) {
		$user = unserialize($_SESSION['user']);
	} else {
		$user = null;
	}
?>
<header>
	<!-- left -->
	<div class="nav-left">
		<a class="logo" href="<?= $homeUrl ?>">
			<img src="<?= PATH_IMAGES . 'logo.svg' ?>" alt="<?= ALT_LOGO ?>" loading="lazy" />
		</a>
		<ul class="nav-links">
			<li>
				<a style="font-weight: bold;" class="hover-link" href="<?= $homeUrl ?>"><?= NAV_SHOP ?></a>
			</li>
			<li>
				<a class="hover-link" href="<?= $carturl ?>"><?= NAV_CART ?></a>
			</li>
			<li>
				<a class="hover-link" href="<?= $homeUrl ?>"><?= NAV_COLLECTIONS ?></a>
			</li>
			<li>
				<a class="hover-link" href="<?= $homeUrl ?>"><?= NAV_CREATOR ?></a>
			</li>
		</ul>
		<form class="search-form" method="GET" action="<?= $searchUrl ?>">
			<input name="q" placeholder="<?= NAV_SEARCH_PLACEHOLDER ?>" />
			<button class="btn-search">
				<img src="<?= PATH_IMAGES . 'search.svg' ?>" alt="<?= ALT_SEARCH ?>" loading="lazy" />
			</button>
		</form>
	</div>
	<!-- right -->
	<div class="nav-right">
		<a class="btn-icon btn-search" href="<?= $searchUrl ?>">
			<img src="<?= PATH_IMAGES . 'search.svg' ?>" alt="<?= ALT_SEARCH ?>" loading="lazy" />
		</a>
		<div class="dropdown dropdown-links">
			<button class="btn-icon btn-links">
				<img src="<?= PATH_IMAGES . 'menu.svg' ?>" alt="<?= ALT_MENU ?>" loading="lazy" />
			</button>
			<ul class="dropdown-content">
				<li>
					<a style="font-weight: bold;" href="<?= $homeUrl ?>"><?= NAV_SHOP ?></a>
				</li>
				<li>
					<a href="<?= $homeUrl ?>"><?= NAV_CART ?></a>
				</li>
				<li>
					<a href="<?= $homeUrl ?>"><?= NAV_COLLECTIONS ?></a>
				</li>
				<li>
					<a href="<?= $homeUrl ?>"><?= NAV_CREATOR ?></a>
				</li>
				<?php
					if (isLoggedIn()) {
						$text = NAV_LOGOUT;
						$url = $logoutUrl;
					} else {
						$text = NAV_LOGIN;
						$url = $loginUrl;
					}
					echo <<<HTML
						<li>
							<a href="$url">$text</a>
						</li>
					HTML;
				?>
			</ul>
		</div>
		<div class="dropdown dropdown-profile">
			<button class="btn-caret">
				<?php
					if ($user) {
						$path = PATH_USERS . $user->getPictureUrl();
						$alt = ALT_PROFILE_PICTURE;
						echo <<<HTML
							<img class="profile-picture" src="$path" alt="$alt" loading="lazy" />
						HTML;
					} else {
						echo NAV_ACCOUNT;
					}
				?>
				<img class="caret-img" src="<?= PATH_IMAGES . 'caret-down.svg' ?>" alt="<?= ALT_MENU ?>" loading="lazy" />
			</button>
			<ul class="dropdown-content">
				<?php
					if ($user) {
						$settingsText = NAV_ACCOUNT_SETTINGS;
						$url = isLoggedIn() && isCreator() ? $data['routes']['GET:Creator#index']->getUrl(['id' => $user->getId()]) : $logoutUrl;
						echo <<<HTML
							<li class="profile">
								<a href="$url">
									<span class="name">{$user->getFirstName()} {$user->getLastName()}</span>
									<span class="email">{$user->getEmail()}</span>
								</a>
							</li>
							<li class="separator">
								<hr />
							</li>
							<li>
								<a href="$settingsUrl">$settingsText</a>
							</li>
						HTML;

						if ($user instanceof Creator) {
							$text = NAV_NEW_PRODUCT;
							$url = $newProductUrl;
						} else if ($user instanceof Admin) {
							$text = NAV_SUPPORT;
							$url = $supportUrl;
						} else {
							$text = BECOME_CREATOR;
							$url = $askCreatorUrl;
						}

						$askCreatorText = BECOME_CREATOR;
						$cartText = NAV_CART;

						echo <<<HTML
							<li>
								<a href="$carturl">$cartText</a>
							</li>
							<li>
								<a href="$url">$text</a>
							</li>
						HTML;
					} else {
						$loginText = NAV_LOGIN;
						$registerText = NAV_REGISTER;
						echo <<<HTML
							<li>
								<a href="$loginUrl">$loginText</a>
							</li>
							<li>
								<a href="$registerUrl">$registerText</a>
							</li>
						HTML;
					}
				?>
				<li class="separator">
					<hr />
				</li>
				<li>
					<a href="<?= $enUrl ?>"><?= EN ?></a>
				</li>
				<li>
					<a href="<?= $frUrl ?>"><?= FR ?></a>
				</li>
				<li class="separator">
					<hr />
				</li>
				<?php
					if ($user) {
						$text = NAV_LOGOUT;
						$url = $logoutUrl;
						echo <<<HTML
							<li>
								<a href="$url">$text</a>
							</li>
						HTML;
					}
				?>
			</ul>
		</div>
	</div>
</header>