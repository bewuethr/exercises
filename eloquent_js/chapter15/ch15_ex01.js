let para = document.querySelector("p");

let fontSize = window.getComputedStyle(para)
	.getPropertyValue("font-size")
	.slice(0, -2);

document.addEventListener("keydown", handleKeys);

function handleKeys(event) {
	if (event.key == "ArrowUp") {
		increaseFontSize(para);
	}
	else if (event.key == "ArrowDown") {
		decreaseFontSize(para);
	}
	else return;

	event.preventDefault();
}

function increaseFontSize(element) {
	fontSize *= 1.1;
	element.style.fontSize = fontSize + "px";

	if (fontSize > 200) {
		element.textContent = "💥";
		document.removeEventListener("keydown", handleKeys);
	}
}

function decreaseFontSize(element) {
	fontSize *= 0.9
	element.style.fontSize = fontSize + "px";
}
