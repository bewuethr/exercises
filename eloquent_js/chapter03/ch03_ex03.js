function countChar(s, c) {
	let count = 0;
	for (let i = 0; i < s.length; ++i) {
		if (s[i] == c) ++count;
	}

	return count;
}

function countBs(s) {
	return countChar(s, "B");
}
