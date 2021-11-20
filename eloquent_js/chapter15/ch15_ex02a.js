function generateColors() {
	const rainbow = [
		{ r: 255, g: 0, b: 0 },
		{ r: 128, g: 0, b: 211 },
		{ r: 75, g: 0, b: 130 },
		{ r: 0, g: 0, b: 255 },
		{ r: 0, g: 255, b: 0 },
		{ r: 255, g: 255, b: 0 },
		{ r: 255, g: 127, b: 0 },
		{ r: 255, g: 0, b: 0 }
	];

	const mapTo = rainbow.length - 1;

	let colors = [];
	const ncolors = 256;

	for (let i = 0; i < ncolors; ++i) {
		let lower = Math.floor(i / ncolors * mapTo);
		let weight = i / ncolors * mapTo - lower;
		let r = rainbow[lower].r + Math.floor(weight * (rainbow[lower+1].r - rainbow[lower].r));
		let g = rainbow[lower].g + Math.floor(weight * (rainbow[lower+1].g - rainbow[lower].g));
		let b = rainbow[lower].b + Math.floor(weight * (rainbow[lower+1].b - rainbow[lower].b));
		colors.push({r, g, b});
	}

	return colors;
}

function generateDots() {
	let dots = [];
	const ndots = 30;

	for (let i = 0; i < ndots; ++i) {
		let dot = document.createElement("div");
		dot.className = "trail";
		dots.push(dot);
	}
	
	return dots;
}

function updateDots(event) {
	dots[idx].style.left = (event.clientX - 3) + "px";
	dots[idx].style.top = (event.clientY - 3) + "px";
	dots[idx].style.background = `rgb(${colors[colorIdx].r}, ${colors[colorIdx].g}, ${colors[colorIdx].b})`;

	idx = (idx + 1) % dots.length;
	colorIdx = (colorIdx + 1) % colors.length;
}

let colors = generateColors();
let dots = generateDots();

for (let dot of dots) {
	document.body.appendChild(dot);
}

let idx = 0, colorIdx = 0;

window.addEventListener("mousemove", updateDots);
