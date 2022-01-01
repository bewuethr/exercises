function draw(pos, state, dispatch) {
	function drawPixel(newPos, state) {
		let drawn = getLinePixels(pos, newPos)
			.map(p => ({...p, color: state.color}));
		pos = newPos;
		dispatch({picture: state.picture.draw(drawn)});
	}
	drawPixel(pos, state);

	return drawPixel;
}

function line(start, state, dispatch) {
	function drawLine(pos) {
		let drawn = getLinePixels(start, pos)
			.map(p => ({...p, color: state.color}));
		dispatch({picture: state.picture.draw(drawn)});
	}
	drawLine(start);

	return drawLine;
}

function getLinePixels(from, to) {
	if (from.x == to.x && from.y == to.y) {
		return [from];
	}

	// Determine if horizontal or vertical difference is larger
	let xDiff = Math.abs(from.x - to.x);
	let yDiff = Math.abs(from.y - to.y);
	let dx = 0, dy = 0;

	// Swap start and end point if necessary, set step size
	if (xDiff > yDiff) {
		if (from.x > to.x) {
			[from, to] = [to, from];
		}
		dx = 1;
		dy = (to.y - from.y) / (to.x - from.x);
	}
	else {
		if (from.y > to.y) {
			[from, to] = [to, from];
		}
		dx = (to.x - from.x) / (to.y - from.y);
		dy = 1;
	}

	let {x, y} = from;
	let pixels = [];
	while (dx == 1 && x <= to.x || dy == 1 && y <= to.y) {
		pixels.push({x: Math.round(x), y: Math.round(y)});
		x += dx;
		y += dy;
	}

	return pixels;
}
