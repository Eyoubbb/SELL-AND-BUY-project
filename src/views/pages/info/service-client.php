<?php
    $homeUrl = $data['routes']['GET:Home#index']->getUrl();
	$contactUrl = $data['routes']['GET:Info#contact']->getUrl();
    $shipReturnUrl = $data['routes']['GET:Info#shippingReturn']->getUrl();
    $legalNoticeUrl = $data['routes']['GET:Info#legalNotice']->getUrl();
    $termsConditionUrl = $data['routes']['GET:Info#termsCondition']->getUrl();
    $username = 'Guest';
    if(isset($_SESSION['user'])) {
        $username = unserialize($_SESSION['user'])->getFirstName();
    }

?>
<section class="container">
    
    <?php require(PATH_COMPONENTS . 'nav-header.php') ?>

    <div class="body-support">
        <div>
            <h1><?= TEXT_WELCOME . ',  ' . $username ?></h1>
        </div>
        <div>
            <p><?= TEXT_TERMS_NOTICE ?></p>
            <p><?= TEXT_CONTACT ?></p>
            <p><?= TEXT_SHIPPING_RETURN ?></p> 
        </div>
        <div class="types">
            <a class="support-type" href="<?= $termsConditionUrl ?>">
                <img src="<?= PATH_IMAGES . 'terms.png' ?>" alt="terms">
                <?= LINK__TERMS_CONDITION ?>
            </a>
            <a class="support-type" href="<?= $legalNoticeUrl ?>">
                <img src="<?= PATH_IMAGES . 'legal.png' ?>" alt="legal">
                <?= LINK_LEGAL_NOTICE ?>
            </a>
            <a class="support-type" href="<?= $shipReturnUrl ?>">
                <img src="<?= PATH_IMAGES . 'box.png' ?>" alt="shipping">
                <?= LINK_SHIPPING_RETURN ?>
            </a>
            <a class="support-type" href="<?= $contactUrl ?>">
                <img src="<?= PATH_IMAGES . 'contacts.png' ?>" alt="contact">
                <?= TERMS_CONDITIONS_LINK_CONTACT_US ?>
            </a>
        </div>
    </div>
</section>