function range(start, end, step) {
    var arr = [];
    var mystep = arguments.length == 3 ? step : 1;
    var val = start;
    while (true) {
        arr.push(val);
        val += mystep;
        if (start < end && val > end || start > end && val < end)
            break;
    }
    return arr;
}

function sum(arr) {
    var res = 0;
    console.log(arr);
    for (var i = 0; i < arr.length; ++i)
        res += arr[i];
    return res;
}
