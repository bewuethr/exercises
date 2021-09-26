function reverseArray(arr) {
	let revArr = [];
	for (let i = arr.length - 1; i >= 0; --i) {
		revArr.push(arr[i]);
	}

	return revArr;
}

function reverseArrayInPlace(arr) {
	for (let i = 0; i < Math.floor(arr.length / 2); ++i) {
		let upperIdx = arr.length - (1 + i);
		let temp = arr[i];
		arr[i] = arr[upperIdx];
		arr[upperIdx] = temp;
	}
}
