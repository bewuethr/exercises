async function locateScalpel(nest) {
	let current = nest.name;

	for (;;) {
		let next = await anyStorage(nest, current, "scalpel");
		if (next == current) {
			return next;
		}

		current = next;
	}
}

function locateScalpel2(nest) {
	function next(current) {
		return anyStorage(nest, current, "scalpel")
			.then(value => value == current ? value : next(value));
	}

	return next(nest.name);
}
