<div class="popup-header">
	<h2>Support Ticket</h2>
	<button class="close">
		<img src="<?= PATH_IMAGES . 'x.svg' ?>" alt="close" loading="lazy"/>
	</button>
</div>
<div class="popup-body">
	<div class="extra-wrapper row">
		<p class="subtitle">Ticket id</p>
		<p><?= $ticket->getId() ?></p>
	</div>
	<div class="extra-wrapper row">
		<p class="subtitle">Created by</p>
		<p><?= $user->getFirstName() . ' ' . $user->getLastName() ?></p>
	</div>
	<div class="extra-wrapper row">
		<p class="subtitle">Date</p>
		<p><?= $ticket->getDate() ?></p>
	</div>
	<div class="extra-wrapper row">
		<p class="subtitle">Type</p>
		<p><?= $ticketType->getName() ?></p>
	</div>
	<div class="extra-wrapper row">
		<p class="subtitle">Assignee</p>
		<p><?= $admin->getFirstName() . ' ' . $admin->getLastName() ?></p>
	</div>
	<div class="extra-wrapper column">
		<p class="subtitle">Description</p>
		<p><?= $ticket->getDescription() ?></p>
	</div>
	<div class="extra-wrapper buttons">
		<?php
		if($resolved) {
					echo <<<HTML
									<a id="resolve" href="$reopenUrl">Reopen</a>
									<a id="delete" href="$deleteUrl">Delete</a>
					HTML;
				} else {
					echo <<<HTML
									<a id="resolve" href="$resolveUrl">Resolve</a>
									<a id="delete" href="$deleteUrl">Delete</a>
					HTML;
				}
		?>
	</div>
</div>