let table = document.getElementById("mountains")
	.appendChild(document.createElement("table"));

let names = Object.keys(MOUNTAINS[0]);

let header = table.appendChild(document.createElement("tr"));
for (let name of names) {
	header.appendChild(document.createElement("th"))
		.appendChild(document.createTextNode(name));
}

for (let mountain of MOUNTAINS) {
	let row = table.appendChild(document.createElement("tr"));
	for (let name of names) {
		let textNode = row.appendChild(document.createElement("td"))
			.appendChild(document.createTextNode(mountain[name]));

		if (typeof mountain[name] == "number") {
			textNode.parentNode.style.textAlign = "right";
		}
	}
}
