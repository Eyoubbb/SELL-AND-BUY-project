<?php

require_once PATH_CORE . 'Model.php';

class CreatorModel extends Model {

	public function profile($creatorId): array | false {

		$creatorDAO = $this->dao('Creator');

		$resCreator = $creatorDAO->findCreatorById($creatorId);

		if ($resCreator === false) {
			$this->setError('ERROR_CREATOR_NOT_FOUND');
			return false;
		}

		$socialMediaDAO = $this->dao('SocialMedia');

		$socialMedias = $socialMediaDAO->findAllByCreator($creatorId);
		
		if ($socialMedias === false) {
			$this->setError('ERROR_SOCIAL_MEDIA_NOT_FOUND');
			return false;
		}
		
		$productDAO = $this->dao('Product');
		
		$products = $productDAO->findAllByCreator($creatorId);

		if ($products === false) {
			$this->setError('ERROR_PRODUCTS_NOT_FOUND');
			return false;
		}

		return [
			'creator' => new Creator($resCreator),
			'socialMedias' => $socialMedias,
			'products' => $products
		];
	}
	
	public function ask(): bool {
		$description = $_POST['description'];
		$motive = $_POST['motive'];
		$user = unserialize($_SESSION['user']);
		var_dump($_FILES);
		if ($_FILES['banner']['size'] == 0) {
			$banner = 'BAN-1.svg';
		} else {
			$picture = $_FILES['banner'];

			$resExif = exif_imagetype($picture['tmp_name']);
			if (!in_array($resExif, [IMAGETYPE_JPEG, IMAGETYPE_PNG, IMAGETYPE_WEBP])) {
				$this->setError('ERROR_INVALID_PICTURE');
				return false;
			}

			if ($picture['size'] > 5_000_000) {
				$this->setError('ERROR_PICTURE_TOO_BIG');
				return false;
			}

			$dimensions = getimagesize($picture['tmp_name']);
			
			if ($dimensions[0] < 1000 || $dimensions[1] < 300) {
				$this->setError('ERROR_PICTURE_TOO_SMALL');
				return false;
			}

			if ($dimensions[0] < 3 * $dimensions[1]) {
				$this->setError('ERROR_PICTURE_TOO_WIDE');
				return false;
			}

			$id = $user->getId();
			$fileName = "BAN-$id." . pathinfo($picture['name'], PATHINFO_EXTENSION);

			if (!move_uploaded_file($picture['tmp_name'], PATH_UPLOAD_CREATOR_BANNERS . $fileName)) {
				$this->setError('ERROR_UPLOADING_PICTURE');
				return false;
			}

			$banner = $fileName;

			$user->setPictureUrl($fileName);
		}

		$creatorDAO = $this->dao('Creator');

		$creator = new Creator();
		$creator->setId($user->getId());
		$creator->setDescription($description);
		$creator->setBannerUrl($banner);
		$creator->setVisible(0);

		$creatorId = $creatorDAO->insertCreator($creator);

		if ($creatorId === false) {
			$this->setError('ERROR_CREATING_CREATOR');
			return false;
		}

		$socialMediaAccountsDAO = $this->dao('SocialMediaAccounts');

		if ( !empty($_POST['facebook'])) {
			$socials = $_POST['facebook'];
			$res = $socialMediaAccountsDAO->setMediaAccount($user->getId(), 1, $socials);

			if ($res === false) {
				$this->setError('ERROR_INSERTING_FACEBOOK');
				return false;
			}
		}

		if ( !empty($_POST['instagram'])) {
			$socials = $_POST['instagram'];
			$res = $socialMediaAccountsDAO->setMediaAccount($user->getId(), 2, $socials);

			if ($res === false) {
				$this->setError('ERROR_INSERTING_INSTAGRAM');
				return false;
			}
		}

		if ( !empty($_POST['youtube'])) {
			$socials = $_POST['youtube'];
			$res = $socialMediaAccountsDAO->setMediaAccount($user->getId(), 3, $socials);

			if ($res === false) {
				$this->setError('ERROR_INSERTING_YOUTUBE');
				return false;
			}
		}

		if ( !empty($_POST['pinterest'])) {
			$socials = $_POST['pinterest'];
			$res = $socialMediaAccountsDAO->setMediaAccount($user->getId(), 4, $socials);

			if ($res === false) {
				$this->setError('ERROR_INSERTING_PINEREST');
				return false;
			}
		}

		if ( !empty($_POST['website'])) {
			$socials = $_POST['website'];
			$res = $socialMediaAccountsDAO->setMediaAccount($user->getId(), 5, $socials);

			if ($res === false) {
				$this->setError('ERROR_INSERTING_WEBISTE');
				return false;
			}
		}

		if ( !empty($_POST['twitter'])) {
			$socials = $_POST['twitter'];
			$res = $socialMediaAccountsDAO->setMediaAccount($user->getId(), 6, $socials);

			if ($res === false) {
				$this->setError('ERROR_INSERTING_TWITTER');
				return false;
			}
		}


		$adminDAO = $this->dao('Admin');
		
		$res = $adminDAO->getAllAdmins();

		if ($res === false) {
			$this->setError('ERROR_FETCHING_ADMINS');
			return false;
		}

		$randomAdmin = rand(0, count($res) - 1);
		$dt = time();
		
		$ticketDAO = $this->dao('Ticket');

		$ticket = new Ticket();
		$ticket->setUserId($user->getId());
		$ticket->setName("Creator registration");
		$ticket->setDescription($motive);
		$ticket->setTicketTypeId(5);
		$ticket->setAdminId($res[$randomAdmin]['admin_id']);
		$ticket->setDate(date('Y-m-d', $dt));
		$ticket->setResolved(0);


		$resTicket = $ticketDAO->createTicket($ticket);

		if ($resTicket === false) {
			$this->setError('ERROR_CREATING_TICKET');
			return false;
		}

		return true;
	}

	public function discover(): array | false {

		$creatorDAO = $this->dao('Creator');

		$creators = $creatorDAO->getAllCreators();

		if ($creators === false) {
			$this->setError('ERROR_FETCHING_CREATORS');
			return false;
		}

		$indexes = array_rand($creators, 3);
		$creatorsOfTheWeek = [];
		foreach ($indexes as $index) {
			$creatorsOfTheWeek[] = $creators[$index];
		}

		foreach($creators as $creator) {

			$productDAO = $this->dao('Product');
			$products = $productDAO->findAllByCreator($creator['creator_id']);
			if ($products !== false) {
				$creatorCategory[$creator['creator_id']] = $creatorDAO->getBestCategory($creator['creator_id']);
			}
		}

		return [
			'creatorsOfTheWeek' => $creatorsOfTheWeek,
			'allCreators' => $creators,
			'creatorCategory' => $creatorCategory
		];
	}
}