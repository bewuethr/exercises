cx.font = "20px sans-serif";
cx.textBaseline = "middle";

for (let result of results) {
	let sliceAngle = (result.count / total) * 2 * Math.PI;
	cx.beginPath();
	cx.arc(centerX, centerY, 100,
	       currentAngle, currentAngle + sliceAngle);
	currentAngle += sliceAngle;
	cx.lineTo(centerX, centerY);
	cx.fillStyle = result.color;
	cx.fill();

	let textAngle = currentAngle - sliceAngle / 2;
	let textX = centerX + 120 * Math.cos(textAngle);
	let textY = centerY + 120 * Math.sin(textAngle);
	cx.textAlign = Math.cos(textAngle) > 0 ? "left" : "right";
	cx.fillText(result.name, textX, textY);
}
