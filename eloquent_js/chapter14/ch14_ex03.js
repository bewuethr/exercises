function animateOpposite(time) {
	if (lastTime != null) angle += (time - lastTime) * 0.001;
	lastTime = time;
	cat.style.top = (Math.sin(angle) * 40 + 40) + "px";
	cat.style.left = (Math.cos(angle) * 200 + 230) + "px";

	hat.style.top = (Math.sin(angle + Math.PI) * 40 + 40) + "px";
	hat.style.left = (Math.cos(angle + Math.PI) * 200 + 230) + "px";

	requestAnimationFrame(animateOpposite);
}

function animateOrbit(time) {
	if (lastTime != null) angle += (time - lastTime) * 0.001;
	lastTime = time;
	catTop = Math.sin(angle) * 40 + 40;
	catLeft = Math.cos(angle) * 200 + 230;
	cat.style.top = catTop + "px";
	cat.style.left = catLeft + "px";

	hat.style.top = (Math.sin(10 * angle) * 30 + catTop) + "px";
	hat.style.left = (Math.cos(10 * angle) * 30 + catLeft) + "px";

	requestAnimationFrame(animateOrbit);
}

function animateWiggle(time) {
	if (lastTime != null) angle += (time - lastTime) * 0.001;
	lastTime = time;
	cat.style.top = (Math.sin(angle) * (40 + Math.sin(20 * angle) * 10) + 40) + "px";
	cat.style.left = (Math.cos(angle) * (200 + Math.sin(20 * angle) * 10) + 230) + "px";

	requestAnimationFrame(animateWiggle);
}
