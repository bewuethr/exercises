function arrayToList(arr) {
    var list = null;
    for (var i = arr.length - 1; i >= 0; --i)
        list = { value: arr[i], rest: list };
    return list;
}

function listToArray(list) {
    var arr = [];
    var myList = list;
    while (myList) {            // More elegant: for (var node = list; node; node = node.rest)
        arr.push(myList.value);
        myList = myList.rest;
    }
    return arr;
}

function prepend(num, list) {
    return { value: num, rest: list };
}

function nth(list, num) {
    var node = list;
    for (var i = 0; i < num; ++i) {
        if (! node.rest)
            return undefined;
        node = node.rest;
    }
    return node.value;
}

function nthRecurse(list, num) {
    if (! list)
        return undefined;
    if (num === 0)
        return list.value;
    return nthRecurse(list.rest, num - 1);
}
