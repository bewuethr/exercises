const monsterSpeed = 5;

class Monster {
	constructor(pos) { this.pos = pos; }

	get type() { return "monster"; }

	static create(pos) {
		return new Monster(pos.plus(new Vec(0, -1)));
	}

	update(time, state) {
		let player = state.player;
		let speed = (player.pos.x < this.pos.x ? -1 : 1) * monsterSpeed;

		let moved = this.pos.plus(new Vec(speed * time, 0));
		if (state.level.touches(moved, this.size, "wall")) {
			return this;
		}

		return new Monster(moved);
	}

	collide(state) {
		let player = state.player;
		if (player.pos.y + player.size.y - 0.3 < this.pos.y) {
			let filtered = state.actors.filter(a => a != this);
			return new State(state.level, filtered, state.status);
		}

		return new State(state.level, state.actors, "lost");
	}
}
