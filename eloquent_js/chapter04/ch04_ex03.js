function arrayToList(array) {
    let list = null;
    for (let i = array.length - 1; i >= 0; --i) {
        list = {value: array[i], rest: list};
    }
    return list;
}

function listToArray(list) {
    let array = [];
    for (let node = list; node; node = node.rest) {
        array.push(node.value);
    }
    return array;
}

function prepend(element, list) {
    return {element, rest: list};
}

function nth(list, n) {
    // Could check if (!list) here instead or in the return expression
    if (n === 0) return list.value;
    else return list.rest ? nth(list.rest, n-1) : undefined;
}
