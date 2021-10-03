function every(array, test) {
	for (let el of array) {
		if (!test(el)) {
			return false;
		}
	}

	return true;
}

function everySome(array, test) {
	return !array.some(n => !test(n));
}
