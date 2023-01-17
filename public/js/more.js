(() => {	
	const btns = document.querySelectorAll(".more-img");

	for(const btn of btns) {
		btn.addEventListener("click", ()=> {
			const more = btn.nextElementSibling;
			more.classList.toggle("hide");
		});
	}
})();