const diameter = 20;
const speed = 300;

function getRandomInt(max) {
	return Math.floor(Math.random() * max);
}

class Ball {
	constructor(pos, vel) {
		this.pos = pos;
		this.vel = vel;
	}

	static create(cx) {
		let x = getRandomInt(cx.canvas.clientWidth - diameter);
		let y = getRandomInt(cx.canvas.clientHeight - diameter);

		let phi = Math.random() * 2 * Math.PI;
		let vX = speed * Math.cos(phi);
		let vY = speed * Math.sin(phi);

		return new Ball(new Vec(x, y), new Vec(vX, vY));
	}

	update(cx, step) {
		let w = cx.canvas.width;
		let h = cx.canvas.height;
		let vX = this.vel.x;
		let vY = this.vel.y;

		if (this.pos.x + vX * step > w - diameter || this.pos.x + vX * step < 0) {
			vX *= -1;
		}

		if (this.pos.y + vY * step > h - diameter || this.pos.y + vY * step < 0) {
			vY *= -1;
		}

		let vel = new Vec(vX, vY);
		return new Ball(this.pos.plus(vel.times(step)), vel);
	}

	erase(cx) {
		cx.clearRect(0, 0, cx.canvas.width, cx.canvas.height);
		cx.beginPath();
	}

	draw(cx) {
		let x = this.pos.x + diameter / 2;
		let y = this.pos.y + diameter / 2;
		cx.arc(x, y, diameter / 2, 0, 7);
		cx.fill();
		cx.strokeRect(0, 0, cx.canvas.width, cx.canvas.height);
	}
}

let ball = Ball.create(cx);

function updateAnimation(step) {
	ball.erase(cx);
	ball = ball.update(cx, step);
	ball.draw(cx);
}
