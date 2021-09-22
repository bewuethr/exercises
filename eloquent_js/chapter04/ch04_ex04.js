function deepEqual(obj1, obj2) {
    if (typeof obj1 != "object" || obj1 == null ||
        typeof obj2 != "object" || obj2 == null) return obj1 === obj2;

    let keys1 = Object.keys(obj1), keys2 = Object.keys(obj2);

    if (keys1.length != keys2.length) return false;

    for (let key of keys1) {
        if (!(keys2.includes(key) &&
              deepEqual(obj1[key], obj2[key]))) return false;
    }
    return true;
}
