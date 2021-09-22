let size = 8;
let line = "";

for (let i = 0; i < size; i++) {
	for (let j = 0; j < size; j++) {
		line += i%2 == j%2 ? " " : "#";
	}
	line += "\n";
}

console.log(line);
