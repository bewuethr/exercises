function reverseArray(array) {
    let newArray = [];
    for (let el of array) {
        newArray.unshift(el);
    }
    return newArray;
}

function reverseArrayInPlace(array) {
    for (let i = 0; i < Math.floor(array.length/2); ++i) {
        let temp = array[i];
        array[i] = array[array.length - 1 - i];
        array[array.length - 1 - i] = temp;
    }
}
