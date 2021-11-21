function asTabs(node) {
	let tabs = Array.from(node.children).map(child => {
		let label = child.getAttribute("data-tabname");
		let button = document.createElement("button");
		button.textContent = label;
		button.addEventListener("click", () => changeTab(label));
		child.style.display = "none";
		return {button, label, content: child};
	});

	// Insert buttons
	for (let i = tabs.length - 1; i >= 0; --i) {
		node.prepend(tabs[i].button);
	}

	function changeTab(label) {
		for (let tab of tabs) {
			let selected = tab.label == label;
			tab.content.style.display = selected ? "" : "none";
			tab.button.style.background = selected ? "red" : "";
		}
	}

	changeTab(tabs[0].label);
}
