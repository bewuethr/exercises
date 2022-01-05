let select = document.querySelector("select");
let editor = document.getElementById("editor");

function getFiles(path) {
	fetch(path)
		.then(resp => resp.text())
		.then(text => {
			for (let file of text.split("\n")) {
				let option = document.createElement("option");
				option.textContent = file;
				select.appendChild(option);
			}
			getFile(select.value);
		});
}

function getFile(file) {
	fetch(file)
		.then(resp => resp.text())
		.then(text => {
			editor.value = text;
			editor.rows = Math.min(text.split("\n").length, 80);
		});

	document.querySelector("label").textContent = "Editing file: " + file;
	select.value = file;
}

function putFile() {
	contents = editor.value;
	fetch(select.value, {method: "PUT", body: contents});
}

document.querySelector("select").addEventListener("change", event => {
	getFile(event.target.value);
});

getFiles("/");
