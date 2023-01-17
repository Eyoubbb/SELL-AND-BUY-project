<?php
	$contact = $data['routes']['GET:Info#contact']->getUrl();
?>

<section class="terms-conditions-and-notice">
    <div class="nav-container fixElementUp">
        <div class="nav">
            <div class="step" title="click me">
                <p title="click me"><?= TERMS_CONDITIONS_TITLE_SECTION_ONE ?></p>
            </div>
            <div class="step" title="click me">
                <p title="click me"><?= TERMS_CONDITIONS_TITLE_SECTION_TWO ?></p>
            </div>
            <div class="step" title="click me">
                <p title="click me"><?= TERMS_CONDITIONS_TITLE_SECTION_THREE ?></p>
            </div>
            <div class="step" title="click me">
                <p title="click me"><?= TERMS_CONDITIONS_TITLE_SECTION_FOUR ?></p>
            </div>
            <div class="step" title="click me">
                <p title="click me"><?= TERMS_CONDITIONS_TITLE_SECTION_FIVE ?></p>
            </div>
            <div class="step" title="click me">
                <p title="click me"><?= TERMS_CONDITIONS_TITLE_SECTION_SIX ?></p>
            </div>
            <div class="step" title="click me">
                <p title="click me"><?= TERMS_CONDITIONS_TITLE_SECTION_SEVEN ?></p>
            </div>
            <div class="step" title="click me">
                <p title="click me"><?= TERMS_CONDITIONS_TITLE_SECTION_EIGHT ?></p>
            </div>
        </div>
    </div>
    <div class="left-space"></div>
    <div class="content">
        <h1><?= INFO_TERMS_CONDITIONS_WINDOW_TITLE ?></h1>

        <h4><?= TERMS_CONDITIONS_SUBTITLE ?></h4>
        <p><?= TERMS_CONDITIONS_PREAMBULE ?></p>

        <h3><?= TERMS_CONDITIONS_TITLE_SECTION_ONE ?></h3>
        <p><?= TERMS_CONDITIONS_SECTION_ONE ?></p>

        <h3><?= TERMS_CONDITIONS_TITLE_SECTION_TWO ?></h3>
        <p><?= TERMS_CONDITIONS_SECTION_TWO ?></p>

        <h3><?= TERMS_CONDITIONS_TITLE_SECTION_THREE ?></h3>
        <p><?= TERMS_CONDITIONS_SECTION_THREE ?></p>

        <h3><?= TERMS_CONDITIONS_TITLE_SECTION_FOUR ?></h3>
        <p><?= TERMS_CONDITIONS_SECTION_FOUR ?></p>

        <h3><?= TERMS_CONDITIONS_TITLE_SECTION_FIVE ?></h3>
        <p><?= TERMS_CONDITIONS_SECTION_FIVE ?></p>

        <h3><?= TERMS_CONDITIONS_TITLE_SECTION_SIX ?></h3>
        <p><?= TERMS_CONDITIONS_SECTION_SIX ?></p>

        <h3><?= TERMS_CONDITIONS_TITLE_SECTION_SEVEN ?></h3>
        <p><?= TERMS_CONDITIONS_SECTION_SEVEN ?></p>

        <h3><?= TERMS_CONDITIONS_TITLE_SECTION_EIGHT ?></h3>
        <p><?= TERMS_CONDITIONS_SECTION_EIGHT ?></p>
        <a href="<?= $contact ?>"><button><?= TERMS_CONDITIONS_LINK_CONTACT_US ?></button></a>
    </div>
    
</section>