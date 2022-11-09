(() => {

	/*************** Confirm password ***************/
	
	const passwordInput = document.querySelector('input[name="password"]');
	const passwordConfirmInput = document.querySelector('input[name="password-confirm"]');

	if (passwordInput && passwordConfirmInput) {
		const verifyPassword = () => {
			if (!passwordInput.checkValidity() || passwordConfirmInput.value !== passwordInput.value) {
				passwordConfirmInput.classList.add('invalid');
			} else {
				passwordConfirmInput.classList.remove('invalid');
			}
		};

		passwordInput.addEventListener('input', verifyPassword);
		passwordConfirmInput.addEventListener('input', verifyPassword);
	}

	/*************** Image preview ***************/

	const imageInput = document.querySelector('input[type="file"]');

	if (imageInput) {
		imageInput.addEventListener('change', e => {
			const [ file ] = e.target.files;
			const imagePreview = document.querySelector('.image-preview');

			if (file && file.type.startsWith('image/') && imagePreview) {
				imagePreview.src = URL.createObjectURL(file)
				imagePreview.classList.remove('hidden');
			} else {
				imagePreview.src = '';
				imagePreview.classList.add('hidden');
			}
		});
	}
	
	/*************** Multistep form ***************/
	
	const form = document.querySelector('form');
	const progressSteps = document.querySelector('.progress-bar').children;
	
	const formSteps = document.querySelectorAll('.step');
	const nextBtns = document.querySelectorAll('.next');
	const prevBtns = document.querySelectorAll('.previous');

	if (!progressSteps || !formSteps || !nextBtns || !prevBtns)
		return;

	let currentStep = 0;

	const setStep = n => {
		if (n < 0 || n > formSteps.length - 1) {
			return;
		}

		for (let i = 0; i < formSteps.length; i++) {
			if (i === n) {
				progressSteps[i].classList.add('active');
				formSteps[i].classList.add('active');
			} else {
				progressSteps[i].classList.remove('active');
				formSteps[i].classList.remove('active');
			}
		}
	};

	const checkValidations = handler => {
		for (const input of formSteps[currentStep].querySelectorAll('input')) {
			if (!input.checkValidity() || input.classList.contains('invalid')) {
				handler && handler();
				return false;
			}
		}
		return true;
	};

	
	const nextStep = () => {
		form.classList.remove('form-invalid');

		const verif = checkValidations(() => {
			form.classList.add('form-invalid');
		});
		
		if (!verif) {
			return;
		}

		setStep(++currentStep);
	};

	const prevStep = () => {
		setStep(--currentStep);
	};

	for (const btn of nextBtns) {
		btn.addEventListener('click', nextStep);
	}

	for (const btn of prevBtns) {
		btn.addEventListener('click', prevStep);
	}

	form.addEventListener('keypress', e => {
		if (e.key === 'Enter') {
			e.preventDefault();
			nextStep();
		}
	});

	for (const i of form.querySelectorAll('input')) {
		i.addEventListener('invalid', e => e.preventDefault());
	}
	
	setStep(currentStep);
	
})();