class Group {
    constructor() {
        this.members = [];
    }

    add(elem) {
        // Could use Group.has() here instead
        if (!this.members.includes(elem)) {
            this.members.push(elem);
        }
    }

    delete(elem) {
        // Don't really need if check here, filter if element is not there is
        // no-op
        if (this.members.includes(elem)) {
            this.members = this.members.filter(e => e !== elem);
        }
    }

    has(elem) {
        return this.members.includes(elem);
    }

    // Better name: collection
    static from(iterable) {
        let group = new Group();
        for (let elem of iterable) {
            group.add(elem);
        }
        return group;
    }
}
