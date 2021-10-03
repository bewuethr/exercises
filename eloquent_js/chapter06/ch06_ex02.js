class Group {
	constructor() {
		this.members = [];
	}

	add(element) {
		if (!this.has(element)) {
			this.members.push(element);
		}
	}

	delete(element) {
		this.members = this.members.filter(e => e !== element);
	}

	has(element) {
		return this.members.includes(element);
	}

	static from(group) {
		let g = new Group;
		for (let element of group) {
			g.add(element);
		}

		return g;
	}
}
