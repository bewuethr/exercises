class PGroup {
	constructor() {
		this.members = [];
	}

	add(elem) {
		let newMembers = this.members.slice(0);
		if (!newMembers.includes.elem) {
			newMembers.push(elem);
		}
		return PGroup.from(newMembers);
	}

	delete(elem) {
		let newMembers = this.members.filter(e => e != elem);
		return PGroup.from(newMembers);
	}

	has(elem) {
		return this.members.includes(elem);
	}

	static from(collection) {
		let group = new PGroup();
		for (let elem of collection) {
			if (!group.members.includes(elem)) {
				group.members.push(elem);
			}
		}
		return group;
	}
}

PGroup.empty = PGroup.from([]);
