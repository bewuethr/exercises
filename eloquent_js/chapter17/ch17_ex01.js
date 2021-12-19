function trapezoid(cx, x, y, top, bottom, height) {
	topOffset = top > bottom ? 0 : (bottom - top) / 2;
	bottomOffset = bottom > top ? 0 : (top - bottom) / 2;

	cx.beginPath();
	cx.moveTo(x + topOffset, y);
	cx.lineTo(x + bottomOffset, y + height);
	cx.lineTo(x + bottomOffset + bottom, y + height);
	cx.lineTo(x + topOffset + top, y);
	cx.closePath();
	cx.stroke();
}

trapezoid(cx, 10, 10, 60, 80, 20);
trapezoid(cx, 100, 10, 90, 40, 30);

