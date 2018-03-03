function range(start, end, step = start < end ? 1 : -1) {
    let arr = [];
    if (step > 0) {
        for (let n = start; n <= end; n += step) {
            arr.push(n);
        }
    } else if (step < 0) {
        for (let n = start; n >= end; n += step) {
            arr.push(n);
        }
    }
    return arr;
}

function sum(arr) {
    let s = 0;
    for (let num of arr) {
        s += num;
    }
    return s;
}
