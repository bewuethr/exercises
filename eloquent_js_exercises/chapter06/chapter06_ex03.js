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

    [Symbol.iterator]() {
        return new GroupIterator(this);
    }
}

class GroupIterator {
    constructor(group) {
        this.idx = 0;
        this.group = group;
    }

    next() {
        if (this.idx == this.group.members.length) return {done: true};

        let value = this.group.members[this.idx];
        ++this.idx;
        return {value, done: false};
    }
}
