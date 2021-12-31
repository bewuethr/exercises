function circle(center, state, dispatch) {
	function drawCircle(pos) {
		function dist(p1, p2) {
			let dx = p1.x - p2.x;
			let dy = p1.y - p2.y;
			return Math.sqrt(Math.pow(dx, 2) + Math.pow(dy, 2));
		}

		let radius = dist(pos, center);
		let xStart = Math.floor(center.x - radius);
		let yStart = Math.floor(center.y - radius);
		let xEnd = Math.ceil(center.x + radius);
		let yEnd = Math.ceil(center.y + radius);
		let drawn = [];

		for (let y = yStart; y < yEnd; ++y) {
			if (y < 0 || y >= state.picture.height) continue;
			for (let x = xStart; x < xEnd; ++x) {
				if (x < 0 || x >= state.picture.width) continue;
				if (dist({x, y}, center) > radius) continue;
				drawn.push({x, y, color: state.color});
			}
		}

		dispatch({picture: state.picture.draw(drawn)});
	}
	drawCircle(center);

	return drawCircle;
}
