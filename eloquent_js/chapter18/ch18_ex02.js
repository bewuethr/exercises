document.getElementById("button")
	.addEventListener("click", () => {
		let result = "";
		try {
			result = Function(document.getElementById("code").value)();
		}
		catch(e) {
			result = e;
		}

		document.getElementById("output")
			.append(document.createTextNode(result + "\n"));
	});
