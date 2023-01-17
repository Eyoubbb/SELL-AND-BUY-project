<?php

$tickets = $data['tickets'];
$admins = $data['admins'];
$users = $data['users'];
$ticketTypes = $data['ticketTypes'];

$pending = 0;
$resolved = 0;
$popup = "popup-ticket";

foreach($tickets as $ticket) {
	$ticket->getResolved() ? $resolved++ : $pending++;
}

// require_once(PATH_COMPONENTS . 'overlay.php');

?>

<section class="support">
	<div class="info-wrapper">
		<div class="info">
			<img class="total" src="<?= PATH_IMAGES . 'ticket.svg' ?>" alt="total-tickets">
			<div>
				<h1><?= count($tickets) ?></h1>
				<p><?= TOTAL_TICKETS ?></p>
			</div>
		</div>
		<div class="info">
			<img class="pending" src="<?= PATH_IMAGES . 'hourglass.svg' ?>" alt="pending-tickets">
			<div>
				<h1><?= $pending ?></h1>
				<p><?= OPEN_TICKETS ?></p>
			</div>
		</div>
		<div class="info">
			<img class="closed" src="<?= PATH_IMAGES . 'archive.svg' ?>" alt="closed-tickets">
			<div>
				<h1><?= $resolved ?></h1>
				<p><?= CLOSED_TICKETS ?></p>
			</div>
		</div>
	</div>

	<div class="ticket">
		<?php
			$pathMore = PATH_IMAGES . 'more.svg';
		?>
		<table>
			<tr class="title">
				<td>
					<span><?= TICKET_ID ?></span>
					<img class="caret-img" src="<?= PATH_IMAGES . 'caret-down.svg' ?>" alt="<?= ALT_MENU ?>" loading="lazy"/></td>
				<td>
					<span><?= TICKET_USER_ID ?></span>
					<img class="caret-img" src="<?= PATH_IMAGES . 'caret-down.svg' ?>" alt="<?= ALT_MENU ?>" loading="lazy"/></td>
				</td>
				<td>
					<span><?= TICKET_NAME ?></span>
					<img class="caret-img" src="<?= PATH_IMAGES . 'caret-down.svg' ?>" alt="<?= ALT_MENU ?>" loading="lazy"/></td>
				</td>
				<td>
					<span><?= TICKET_ASIGNEE?></span>
					<img class="caret-img" src="<?= PATH_IMAGES . 'caret-down.svg' ?>" alt="<?= ALT_MENU ?>" loading="lazy"/></td>
				</td>
				<td>
					<span><?= TICKET_STATUS ?></span>
					<img class="caret-img" src="<?= PATH_IMAGES . 'caret-down.svg' ?>" alt="<?= ALT_MENU ?>" loading="lazy"/></td>
				</td>
				<td>
					<span><?= TICKET_DATE ?></span>
					<img class="caret-img" src="<?= PATH_IMAGES . 'caret-down.svg' ?>" alt="<?= ALT_MENU ?>" loading="lazy"/></td>
				</td>
				<td>
					<span><?= TICKET_ACTION ?></span>
					<img class="caret-img" src="<?= PATH_IMAGES . 'caret-down.svg' ?>" alt="<?= ALT_MENU ?>" loading="lazy"/></td>
				</td>
			</tr>
			<?php
				foreach($tickets as $ticket) {
					$user = $users[$ticket->getUserId()];
					$admin = $admins[$ticket->getAdminId()];
					$ticketType = $ticketTypes[$ticket->getTicketTypeId()];
					$status = $ticket->getResolved() ? TICKET_CLOSED : TICKET_OPENED;
					$resolved = $ticket->getResolved();
					$resolveUrl = $data['routes']['GET:Admin#resolve']->getUrl([
						'id' => $ticket->getId()
					]);
					$reopenUrl = $data['routes']['GET:Admin#reopen']->getUrl([
						'id' => $ticket->getId()
					]);
					$deleteUrl = $data['routes']['GET:Admin#delete']->getUrl([
						'id' => $ticket->getId()
					]);

					echo <<<HTML
						<tr>
							<td>{$ticket->getId()}</td>
							<td>{$user->getFirstName()}</td>
							<td>{$ticketType->getName()}</td>
							<td>{$admin->getFirstName()}</td>
							<td>{$status}</td>
							<td>{$ticket->getDate()}</td>
							<td>
								<div class="dropdown">
									<img class="more-img" src="$pathMore" alt="more-button">
									<div class="more hide">
					HTML;

					if($resolved) {
						echo <<<HTML
										<a id="resolve" href="$reopenUrl">Reopen</a>
										<a id="delete" href="$deleteUrl">Delete</a>
										<a id="{$ticket->getId()}" class="extra" >More</a>
						HTML;
					} else {
						echo <<<HTML
										<a id="resolve" href="$resolveUrl">Resolve</a>
										<a id="delete" href="$deleteUrl">Delete</a>
										<a id="{$ticket->getId()}" class="extra" >More</a>
						HTML;
					}
					require(PATH_POPUPS . 'popup.php');

					echo <<<HTML
									</div>
								</div>
							</td>
						</tr>
					HTML;



				}
			?>
		</table>
	</div>
</section>

