function Promise_all(promises) {
	return new Promise((resolve, reject) => {
		let result = [];
		let unresolved = promises.length;
		if (unresolved == 0) resolve(result);

		for (let i = 0; i < promises.length; ++i) {
			promises[i]
				.then(value => {
					result[i] = value;
					--unresolved;
					if (unresolved == 0) resolve(result);
				})
				.catch(reject);
		}
	});
}
