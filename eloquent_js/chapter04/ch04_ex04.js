function deepEqual(a, b) {
	if (!(isObject(a) && isObject(b))) return a === b;

	for (let key of Object.keys(a)) {
		if (!(key in b)) return false;
		if (!deepEqual(a[key], b[key])) return false;
	}

	return true;
}

function isObject(a) {
	return typeof a == "object" && a != null;
}
