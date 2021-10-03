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

	Symbol.iterator = function() {
		return new GroupIterator(this);
	}
}

class GroupIterator {
	constructor(group) {
		this.pos = 0;
		this.group = group;
	}

	next() {
		if (this.pos == this.group.length) {
			return {value: undefined, done: true};
		}

		return {value: this.group[this.pos++], done: false};
	}
}
