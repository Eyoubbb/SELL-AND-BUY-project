<?php
    $creatorUrl = $data['routes']['GET:Creator#index']->getUrl(['id' => $creator->getId()]);
?>

<div class="item-creator">
    <a href="<?= $creatorUrl ?>">
        <div class="image">
            <img src="<?= PATH_USERS . $creator->getPictureUrl() ?>" alt="profile picture creator" loading="lazy">
        </div>
        <div class="content-text">
            
            <div class="up">
                <p class="creator-name"><?= $creator->getFullName() ?></p>
            </div>

            <div class="separator"></div>
            
            <div class="down">
                <p class="creator-category"><?= $mainCategorie ?></p>
                <p class="creator-description"><?= $creator->getDescription() ?></p>
            </div>
        
        </div>
    </a>
</div>