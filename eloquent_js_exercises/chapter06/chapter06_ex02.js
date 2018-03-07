class Group {
    constructor() {
        this.members = [];
    }

    add(elem) {
        if (!this.members.includes(elem)) {
            this.members.push(elem);
        }
    }

    delete(elem) {
        if (this.members.includes(elem)) {
            this.members = this.members.filter(e => e !== elem);
        }
    }

    has(elem) {
        return this.members.includes(elem);
    }

    static from(iterable) {
        let group = new Group();
        for (let elem of iterable) {
            group.add(elem);
        }
        return group;
    }
}
