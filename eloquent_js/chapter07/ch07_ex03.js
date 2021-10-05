class PGroup {
	constructor(array) {
		this.members = array;
	}

	add(element) {
		return new PGroup(this.members.slice().push(element));
	}

	delete(element) {
		return new PGroup(this.members.filter(e => e !== element));
	}

	has(element) {
		return this.members.includes(element);
	}
}

PGroup.empty = new PGroup([]);
