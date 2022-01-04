import process from "process";
import {stat, readdir, readFile} from "fs/promises";
import {sep} from "path";

if (process.argv.length < 4) {
	console.error("usage: node ch20_ex01.js REGEX FILE [FILE...]");
	process.exit(1);
}

let reStr = process.argv[2];
let files = process.argv.slice(3);
let re = new RegExp(reStr);

while (files.length > 0) {
	let file = files.shift();
	let stats;
	try {
		stats = await stat(file);
	}
	catch (err) {
		console.error(err.message);
		continue;
	}

	if (stats.isDirectory()) {
		try {
			let dirfiles = await readdir(file);
			files.push(...dirfiles.map(f => file + sep + f));
		}
		catch (err) {
			console.error(err.message);
		}
		continue;
	}

	let contents;
	try {
		contents = await readFile(file, "utf8");
	}
	catch (err) {
		console.error(err.message);
		continue;
	}

	if (re.test(contents)) {
		console.log(file);
	}
}
