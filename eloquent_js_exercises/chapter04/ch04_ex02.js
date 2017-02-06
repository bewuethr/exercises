function reverseArray(arr) {
    var revArr = [];
    for (var i = 0; i < arr.length; ++i)
        revArr.unshift(arr[i]);
    return revArr;
}

function reverseArrayInPlace(arr) {
    for (var i = 0; i < arr.length/2; ++i) {
        var tmp = arr[i];
        arr[i] = arr[arr.length - 1 -i];
        arr[arr.length - 1 -i] = tmp;
    }
}
