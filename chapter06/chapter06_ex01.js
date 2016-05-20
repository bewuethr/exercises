function Vector(x, y) {
    this.x = x;
    this.y = y;
}

Vector.prototype.plus = function(vec) {
    return new Vector(this.x + vec.x, this.y + vec.y);
}

Vector.prototype.minus = function(vec) {
    return new Vector(this.x - vec.x, this.y - vec.y);
}

Object.defineProperty(Vector.prototype, "length", {
    get: function() {
        return Math.sqrt(Math.pow(this.x, 2) + Math.pow(this.y, 2));
    }
});
