
<?php 
	$user = unserialize($_SESSION['user']);

	require(PATH_COMPONENTS . 'nav-header.php'); 
?>

<section class="form-container">
    <form method="POST" <?= isset($enctype) ? 'enctype="' . $enctype . '"' : "" ?>>
        <section class="help">
            <div class="main-title">
                <h1><?= SETTINGS_HELP_FORM_TITLE ?></h1>
                <p><?= SETTINGS_HELP_FORM_SUBTITLE ?></p>
                <p><?= SETTINGS_HELP_FORM_SUBTITLE_SECOND ?></p>
            </div>
            <div class="main-body">
                <div class="wrapper">
                    <h1><?= SETTINGS_HELP_SUBJECT ?></h1>
                    <select name="subject" id="subject">
                        <?php
                            foreach ($data['ticketTypes'] as $subjectArray) {

                                $subject = new TicketTypes($subjectArray);

                                if ($subject->getId() !== 5) {
                                    echo '<option value="' . $subject->getId() . '">' . $subject->getName() . '</option>';
                                }
                            }
                        ?>
                    </select>
                </div>
                <div class="wrapper">
                    <h1><?= SETTINGS_HELP_TITLE_REQUEST ?></h1>
                    <input class="text-box" type="text" name="name-request" id="name-request" placeholder="<?= SETTINGS_HELP_TITLE_REQUEST_PLACEHOLDER ?>">
                </div>	
                <div class="wrapper">
                    <h1><?= SETTINGS_HELP_CONTENT ?></h1>
                    <textarea name="content-request" id="content-request" cols="50" rows="5" placeholder="<?= SETTINGS_HELP_CONTENT_PLACEHOLDER ?>"></textarea>
                </div>
            </div>
            <button class="save" type="submit"><?= SETTINGS_HELP_SUBMIT ?></button>
        </section>
    </form>
</section>