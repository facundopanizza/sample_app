document.addEventListener("turbo:load", function() {
	let account = document.querySelector("#account");
	account.addEventListener("click", (event) => {
		event.preventDefault();
		event.stopPropagation();
		let menu = document.querySelector("#dropdown-menu");
		menu.classList.toggle("active");
	});
});
