function skipSpace(string) {
	let match = string.match(/^(\s+|#.*)*/);
	return string.slice(match[0].length);
}
