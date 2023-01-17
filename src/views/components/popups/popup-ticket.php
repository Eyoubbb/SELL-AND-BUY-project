<div class="popup-header">
	<h2>Support Ticket</h2>
	<p>#</p>
</div>
<div class="popup-body">
	<div class="extra-wrapper row">
		<p>Created by</p>
	</div>
	<div class="extra-wrapper row">
		<p>Date</p>
	</div>
	<div class="extra-wrapper row">
		<p>Type</p>
		<p></p>
	</div>
	<div class="extra-wrapper row">
		<p>Assignee</p>
		<p>Test</p>
	</div>
	<div class="extra-wrapper column">
		<p>Description</p>
		<p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Assumenda accusantium iste facilis veniam, quidem velit neque corporis necessitatibus repellat enim, reprehenderit placeat praesentium impedit beatae ex autem! Blanditiis, libero accusantium?</p>
	</div>
	<div class="extra-wrapper">
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