function asTabs(node) {
	for (let child of node.children) {
		let label = child.getAttribute("data-tabname");
		let button = document.createElement("button");
		button.appendChild(document.createTextNode(label));
		button.addEventListener(
			"click",
			event => changeTab(event.target.firstChild.nodeValue)
		);
		child.style.display = "none";
		tabs.push({
			button,
			label,
			content: child 
		});
	}

	changeTab(tabs[0].label);

	// Insert buttons
	for (let i = tabs.length - 1; i >= 0; --i) {
		node.prepend(tabs[i].button);
	}
}

function changeTab(label) {
	for (let tab of tabs) {
		if (tab.label == label) {
			tab.content.style.display = "block";
			tab.button.style.background = "red";
		}
		else {
			tab.content.style.display = "none";
			tab.button.style.background = "";
		}
	}
}

let tabs = [];
