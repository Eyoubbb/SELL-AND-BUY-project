<section class="discover-creators">
    <section class="all-creators">
        <h1><?= DISCOVER_TITLE_ALL_CREATORS  ?></h1>
        <div class="creators">

            <?php

                foreach ($data['allCreators'] as $creatorArray) {

                    $creator = new Creator ($creatorArray);

                    $mainCategorie = $data['creatorCategory'][$creator->getId()]['category_name'];

                    require PATH_COMPONENTS . 'creator.php';
                
                }
            ?>

        </div>

    </section>
    <section class="void">

    </section>
    <section class="creators-of-week fixElementUp">
        <div class="content">
            <h1><?= DISCOVER_TITLE_CREATORS_OF_WEEK ?></h1>
            
            <?php

                foreach ($data['creatorsOfTheWeek'] as $creatorArray) {

                    $creator = new Creator($creatorArray);

                    $mainCategorie = $data['creatorCategory'][$creator->getId()]['category_name'];

                    require PATH_COMPONENTS . 'creator.php';
                
                }

            ?>

        </div>
    </section>
</section>