class Vec {
    constructor(x, y) {
        this.x = x;
        this.y = y;
    }

    plus(v) {
        return new Vec(this.x + v.x, this.y + v.y);
    }

    minus(v) {
        return new Vec(this.x - v.x, this.y - v.y);
    }

    get length() {
        return Math.sqrt(this.x**2 + this.y**2);
    }
}
