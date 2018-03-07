function every1(array, test) {
    for (let elem of array) {
        if (!test(elem)) return false;
    }
    return true;
}

function every2(array, test) {
    return !array.some(elem => !test(elem));
}

console.log(every1([1, 3, 5], n => n < 10));
// → true
console.log(every1([2, 4, 16], n => n < 10));
// → false
console.log(every1([], n => n < 10));
// → true

console.log(every2([1, 3, 5], n => n < 10));
// → true
console.log(every2([2, 4, 16], n => n < 10));
// → false
console.log(every2([], n => n < 10));
// → true
