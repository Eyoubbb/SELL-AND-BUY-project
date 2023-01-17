<div class="popup-header">
	<h2>Support Ticket</h2>
	<button id="close">
		<img src="<?= PATH_IMAGES . 'x.svg' ?>" alt="close" loading="lazy"/>
	</button>
</div>
<div class="popup-body">
	<div class="extra-wrapper row">
		<p class="subtitle">Ticket id</p>
	</div>
	<div class="extra-wrapper row">
		<p class="subtitle">Created by</p>
	</div>
	<div class="extra-wrapper row">
		<p class="subtitle">Date</p>
	</div>
	<div class="extra-wrapper row">
		<p class="subtitle">Type</p>
		<p></p>
	</div>
	<div class="extra-wrapper row">
		<p class="subtitle">Assignee</p>
		<p>Test</p>
	</div>
	<div class="extra-wrapper column">
		<p class="subtitle">Description</p>
		<p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Assumenda accusantium iste facilis veniam, quidem velit neque corporis necessitatibus repellat enim, reprehenderit placeat praesentium impedit beatae ex autem! Blanditiis, libero accusantium?</p>
	</div>
	<div class="extra-wrapper buttons">
		<?php
		if($resolved) {
					echo <<<HTML
									<a id="resolve" href="">Reopen</a>
									<a id="delete" href="">Delete</a>
					HTML;
				} else {
					echo <<<HTML
									<a id="resolve" href="">Resolve</a>
									<a id="delete" href="">Delete</a>
					HTML;
				}
		?>
	</div>
</div>