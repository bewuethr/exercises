function arrayToList(arr) {
	if (arr.length == 0) return null;

	let list = null;
	for (let i = arr.length - 1; i >= 0; --i) {
		list = {value: arr[i], rest: list};
	}

	return list;
}

function listToArray(list) {
	let arr = [];

	for (let node = list; node; node = node.rest) {
		arr.push(node.value)
	}

	return arr;
}

function prepend(elem, list) {
	return {value: elem, rest: list};
}

function nth(list, n) {
	if (n == 0) {
		return list.value;
	}

	if (list.rest == null) {
		return undefined;
	}

	return nth(list.rest, n -1);
}
