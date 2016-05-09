// Number of object properties
function propCount(obj) {
    var ctr = 0;
    for (var prop in obj)
        ++ctr;
    return ctr;
}

function deepEqual(obj1, obj2) {
    if (typeof obj1 == "object" && obj1 != null &&
        typeof obj2 == "object" && obj2 != null)
    {
        if (propCount(obj1) !== propCount(obj2))
            return false;
        for (var prop in obj1) {
            if (! prop in obj2)
                return false;
            if (deepEqual(obj1[prop], obj2[prop]) === false)
                return false;
        }
        return true;
    }
    else
        return obj1 === obj2;
}
