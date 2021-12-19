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
	let isLeft = true;

	for (let i = 0; i < n; ++i) {
		x += isLeft ? w : -w;
		y += dy;
		cx.lineTo(x, y);
		isLeft = !isLeft;
	}

	cx.stroke();
}

trapezoid(cx, 10, 10, 60, 80, 20);
trapezoid(cx, 100, 10, 90, 40, 30);

diamond(cx, 200, 10, 30, "red");
diamond(cx, 250, 10, 45, "blue");

zigZag(cx, 320, 10, 50, 30, 3);
zigZag(cx, 400, 10, 25, 100, 50);
