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

trapezoid(cx, 10, 10, 60, 80, 20);
trapezoid(cx, 100, 10, 90, 40, 30);

diamond(cx, 10, 60, 30, "red");
diamond(cx, 60, 60, 45, "blue");
