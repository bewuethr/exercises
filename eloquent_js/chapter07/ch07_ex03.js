class PGroup {
	constructor(array) {
		this.members = array;
	}

	add(element) {
		if (this.has(element)) return this;
		return new PGroup(this.members.concat([element]));
	}

	delete(element) {
		if (!this.has(element)) return this;
		return new PGroup(this.members.filter(e => e !== element));
	}

	has(element) {
		return this.members.includes(element);
	}
}

PGroup.empty = new PGroup([]);
