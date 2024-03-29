function trapezoid(cx, x, y, top, bottom, height) {
	let topOffset = top > bottom ? 0 : (bottom - top) / 2;
	let bottomOffset = bottom > top ? 0 : (top - bottom) / 2;

	cx.beginPath();
	cx.moveTo(x + topOffset, y);
	cx.lineTo(x + bottomOffset, y + height);
	cx.lineTo(x + bottomOffset + bottom, y + height);
	cx.lineTo(x + topOffset + top, y);
	cx.closePath();
	cx.stroke();
}

function diamond(cx, x, y, side, col) {
	let offset = side / Math.sqrt(2);

	cx.save();
	cx.translate(x + offset, y);
	cx.rotate(Math.PI / 4);
	cx.fillStyle = col;
	cx.fillRect(0, 0, side, side);
	cx.restore();
}

function zigZag(cx, x, y, w, h, n) {
	let dy = h / n;
	cx.moveTo(x, y);

	for (let i = 0; i < n; ++i) {
		x += (i % 2 == 0) ? w : -w;
		y += dy;
		cx.lineTo(x, y);
	}

	cx.stroke();
}

function spiral(cx, x, y, radius, n) {
	const nSeg = 100;
	let dPhi = 2 * n * Math.PI / nSeg;
	let dr = radius / nSeg;
	let r = 0, phi = 0;

	cx.moveTo(x, y);

	for (let i = 0; i < nSeg; ++i) {
		r += dr;
		phi += dPhi;
		cx.lineTo(x + r * Math.cos(phi), y + r * Math.sin(phi));
	}

	cx.stroke();
}

function star(cx, x, y, r, nSpikes = 8, col = "khaki") {
	let dPhi = 2 * Math.PI / nSpikes, phi = -0.5 * Math.PI;

	cx.beginPath();
	cx.moveTo(x, y - r);

	for (let i = 0; i < nSpikes; ++i) {
		cx.quadraticCurveTo(x, y, x + r * Math.cos(phi + dPhi), y + r * Math.sin(phi + dPhi));
		phi += dPhi;
	}

	cx.fillStyle = col;
	cx.fill();
}

trapezoid(cx, 10, 10, 60, 80, 20);
trapezoid(cx, 110, 10, 90, 40, 30);

diamond(cx, 220, 10, 30, "red");
diamond(cx, 280, 10, 45, "blue");

zigZag(cx, 360, 10, 50, 30, 3);
zigZag(cx, 430, 10, 25, 100, 50);

spiral(cx, 500, 35, 25, 5);
spiral(cx, 595, 60, 50, 4.75);

star(cx, 695, 40, 30);
star(cx, 795, 60, 50, 13, "orange");
