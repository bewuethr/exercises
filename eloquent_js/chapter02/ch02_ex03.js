let size = 8;

for (let i = 0; i < size; i++) {
	let line = "";
	for (let j = 0; j < size; j++) {
		line += i%2 == j%2 ? " " : "#";
	}
	console.log(line);
}
