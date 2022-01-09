function findPath(a, b) {
	let work = [];
	work.push([a]);

	for (let idx = 0; idx < work.length; ++idx) {
		let path = work[idx];
		let last = path[path.length - 1];
		if (last == b) {
			return path;
		}

		for (let next of last.edges) {
			if (!work.some(path => path[path.length - 1] == next)) {
				work.push(path.concat(next));
			}
		}
	}

	return null;
}
