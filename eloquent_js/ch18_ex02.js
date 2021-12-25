let button = document.getElementById("button");
let code = document.getElementById("code");
let output = document.getElementById("output");

function runFunc(code, output) {
	let result = "";
	try {
		let func = Function("", code.value);
		result = func();
	}
	catch(e) {
		result = e;
	}

	let node = document.createTextNode(result + "\n");
	output.append(node);
}

button.addEventListener("click", () => runFunc(code, output));
