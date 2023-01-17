(() => {	
	const btns = document.querySelectorAll(".more-img");
	const closePopup = document.querySelectorAll(".close");
	const extras = document.querySelectorAll(".extra");

	for(const btn of btns) {
		btn.addEventListener("click", ()=> {
			const more = btn.nextElementSibling;
			more.classList.toggle("hide");
		});
	}

	for(const extra of extras) {
		extra.addEventListener("click", (e)=> {
			const popup = e.target.nextElementSibling;
			popup.classList.toggle("hide");
		});
	}

	for(const close of closePopup) {
		close.addEventListener("click", (e)=> {
			const popup = e.target.closest(".popup");
			popup.classList.toggle("hide");
		});
	}
})();