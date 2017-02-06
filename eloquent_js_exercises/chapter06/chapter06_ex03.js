function ArraySeq(array) {
    this.array = array;
    this.counter = 0;
}
Object.defineProperty(ArraySeq.prototype, "atEnd", {
    get: function() {
        return this.counter == this.array.length;
    }
});
ArraySeq.prototype.getNext = function() {
    return this.array[this.counter++];
}

function RangeSeq(from, to) {
    this.array = [];
    for (var i = from; i <= to; ++i)
        this.array.push(i);
    this.counter = 0;
}
Object.defineProperty(RangeSeq.prototype, "atEnd", {
    get: function() {
        return this.counter == this.array.length;
    }
});
RangeSeq.prototype.getNext = function() {
    return this.array[this.counter++];
}

function logFive(sequence) {
    for (var i = 0; i < 5; ++i) {
        if (sequence.atEnd)
            break;
        else
            console.log(sequence.getNext());
    }
}
