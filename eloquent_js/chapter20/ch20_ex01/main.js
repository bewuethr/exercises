import process from "process";
import {readFile} from "fs/promises";

if (process.argv.length < 4) {
	console.error("usage: node main.js REGEX FILE [FILE...]");
	process.exit(1);
}

let reStr = process.argv[2];
let files = process.argv.slice(3);
let re = new RegExp(reStr);

for (let file of files) {
	let contents = "";
	try {
		contents = await readFile(file, "utf8");
	}
	catch (err) {
		if (err.code == "ENOENT") {
			console.error(err.message);
			continue;
		}
		console.error(err.message);
		process.exit(1);
	}

	if (re.test(contents)) {
		console.log(file);
	}
}
