<form method="POST">
	<div class="field">
		<label for="input-email"><?= LOGIN_REGISTER_EMAIL ?></label>
		<input type="email" name="email" placeholder=" " id="input-email" required>
		<?php
			if (isset($data['error']) && $data['error'] === 'INVALID_EMAIL') {
				echo '<span class="error">' . LOGIN_EMAIL_ERROR . '</span>';
			}
		?>
	</div>
	<div class="field">
		<label for="input-password"><?= LOGIN_REGISTER_PASSWORD ?></label>
		<input type="password" name="password" pattern=".*\S.*" placeholder=" " id="input-password" required>
		<?php
			if (isset($data['error']) && $data['error'] === 'INVALID_PASSWORD') {
				echo '<span class="error">' . LOGIN_PASSWORD_ERROR . '</span>';
			}
		?>
	</div>
	<div class="commands">
		<button class="submit"><?= LOGIN_SUBMIT ?></button>
	</div>
</form>