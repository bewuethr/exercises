function range(start, end, step = end > start ? 1 : -1) {
	let arr = [];
	for (let n = start; Math.abs(n - start) <= Math.abs(end - start); n += step) {
		arr.push(n);
	}

	return arr;
}

function sum(arr) {
	let sum = 0;
	for (let n of arr) {
		sum += n;
	}

	return sum;
}
