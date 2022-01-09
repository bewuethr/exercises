function findPath(a, b) {
	let work = [];
	work.push([a]);

	for (let path of work) {
		let last = path[path.length - 1];
		if (last == b) return path;

		for (let next of last.edges) {
			if (!work.some(path => path[path.length - 1] == next)) {
				work.push(path.concat(next));
			}
		}
	}

	return null;
}
