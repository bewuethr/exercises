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

	[Symbol.iterator]() {
		return new GroupIterator(this);
	}
}

class GroupIterator {
	constructor(group) {
		this.pos = 0;
		this.group = group;
	}

	next() {
		if (this.pos >= this.group.members.length) {
			return {done: true};
		}

		return {
			value: this.group.members[this.pos++],
			done: false
		};
	}
}
