(() => {	
	const btns = document.querySelectorAll(".more-img");
	const closePopup = document.querySelector("button#close");
	const extra = document.querySelector("#extra");
	const overlay = document.querySelector("#overlay");
	const popup = document.querySelector(".popup");

	for(const btn of btns) {
		btn.addEventListener("click", ()=> {
			const more = btn.nextElementSibling;
			more.classList.toggle("hide");
		});
	}

	extra.addEventListener("click", ()=> {
		overlay.classList.toggle("hide");
		popup.classList.toggle("hide");
	});

	closePopup.addEventListener("click", ()=> {

		overlay.classList.toggle("hide");
		popup.classList.toggle("hide");
	});
})();