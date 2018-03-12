class PGroup {
	constructor(members) {
		this.members = members;
	}

	add(elem) {
		if (this.has(elem)) return this;
		return new PGroup(this.members.concat(elem));
	}

	delete(elem) {
		if (!this.has(elem)) return this;
		return new PGroup(this.members.filter(e => e !== elem));
	}

	has(elem) {
		return this.members.includes(elem);
	}
}

PGroup.empty = new PGroup([]);
