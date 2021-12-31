PictureCanvas.prototype.syncState = function(picture) {
	if (this.picture == picture) return;
	drawPicture(picture, this.dom, scale, this.picture);
	this.picture = picture;
};

function drawPicture(picture, canvas, scale, oldPicture) {
	if (!oldPicture
		|| picture.width != oldPicture.width
		|| picture.height != oldPicture.height
	) {
		canvas.width = picture.width * scale;
		canvas.height = picture.height * scale;
		oldPicture = null;
	}

	let cx = canvas.getContext("2d");

	for (let y = 0; y < picture.height; y++) {
		for (let x = 0; x < picture.width; x++) {
			let newCol = picture.pixel(x, y);
			if (!oldPicture || newCol != oldPicture.pixel(x, y)) {
				cx.fillStyle = newCol;
				cx.fillRect(x * scale, y * scale, scale, scale);
			}
		}
	}
}
