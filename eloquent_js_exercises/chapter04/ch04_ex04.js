function deepEqual(obj1, obj2) {
    if (typeof obj1 != "object" || obj1 == null ||
        typeof obj2 != "object" || obj2 == null)
    {
        return obj1 === obj2;
    } else {
        if (Object.keys(obj1).length != Object.keys(obj2).length) {
            return false;
        }
        for (let key of Object.keys(obj1)) {
            if (!(obj2[key] && deepEqual(obj1[key], obj2[key]))) return false;
        }
        return true;
    }
}
