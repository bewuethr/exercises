function addTable(id, data) {
	const headerTag = "th", dataTag = "td";

	let table = document.getElementById(id)
		.appendChild(document.createElement("table"));

	function appendCell(node, tag, text) {
		return node.appendChild(document.createElement(tag))
			.appendChild(document.createTextNode(text));
	}

	let names = Object.keys(data[0]);

	let header = table.appendChild(document.createElement("tr"));
	names.forEach(function(name) {
		appendCell(header, headerTag, name);
	});

	data.forEach(function(mountain) {
		let row = table.appendChild(document.createElement("tr"));
		names.forEach(function(name) {
			let textNode = appendCell(row, dataTag, mountain[name]);

			if (typeof mountain[name] == "number") {
				textNode.parentNode.style.textAlign = "right";
			}
		});
	});
}

addTable("mountains", MOUNTAINS);
