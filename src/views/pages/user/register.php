<form method="POST" enctype="multipart/form-data">
	<ul class="progress-bar">
		<li class="active"><?= REGISTER_STEP_ACCOUNT_SETUP ?></li>
		<li><?= REGISTER_STEP_PERSONAL_DETAILS ?></li>
		<li><?= REGISTER_STEP_PROFILE_PICTURE ?></li>
	</ul>
	<fieldset class="step active">
		<div class="field">
			<label for="input-email"><?= LOGIN_REGISTER_EMAIL ?></label>
			<input type="email" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" placeholder=" " id="input-email" required>
		</div>
		<div class="field">
			<label for="input-password"><?= LOGIN_REGISTER_PASSWORD ?></label>
			<input type="password" name="password" pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,20}$" placeholder="<?= REGISTER_PLACEHOLDER_PASSWORD ?>" id="input-password" required>
		</div>
		<div class="field">
			<label for="input-password-confirm"><?= REGISTER_CONFIRM_PASSWORD ?></label>
			<input type="password" name="password-confirm" placeholder=" " id="input-password-confirm" required>
		</div>
		<div class="commands">
			<button class="next" type="button"><?= REGISTER_NEXT ?></button>
		</div>
	</fieldset>
	<fieldset class="step">
		<div class="field">
			<label for="input-first-name"><?= REGISTER_FIRST_NAME ?></label>
			<input type="text" name="first-name" pattern=".*\S.*" placeholder=" " id="input-first-name" required>
		</div>
		<div class="field">
			<label for="input-last-name"><?= REGISTER_LAST_NAME ?></label>
			<input type="text" name="last-name" pattern=".*\S.*" placeholder=" " id="input-last-name" required>
		</div>
		<div class="commands">
			<button class="previous" type="button"><?= REGISTER_PREVIOUS ?></button>
			<button class="next" type="button"><?= REGISTER_NEXT ?></button>
		</div>
	</fieldset>
	<fieldset class="step">
		<div class="field">
			<label for="input-picture"><?= REGISTER_PROFILE_PICTURE ?></label>
			<input type="file" accept=".jpg,.png,.webp" name="picture" id="input-picture" required>
		</div>
		<div class="container-image">
			<img class="image-preview hidden" src="" alt="<?= REGISTER_PROFILE_PICTURE_PREVIEW ?>">
		</div>
		<div class="commands">
			<button class="previous" type="button"><?= REGISTER_PREVIOUS ?></button>
			<button class="submit"><?= REGISTER_SUBMIT ?></button>
		</div>
	</fieldset>
</form>