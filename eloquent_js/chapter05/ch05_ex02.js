function loop(val, test, update, body) {
	for (let v = val; test(v); v = update(v)) {
		body(v);
	}
}
