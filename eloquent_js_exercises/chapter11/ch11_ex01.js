async function locateScalpel(nest) {
    let curNest = nest.name;
    for (;;) {
        let scalpelLoc = await anyStorage(nest, curNest, "scalpel");
        if (scalpelLoc == curNest) return curNest;
        curNest = scalpelLoc;
    }
}

function locateScalpel2(nest) {
    let next = nest.name;
    function getNext(next) {
        return anyStorage(nest, next, "scalpel")
            .then(val => val == next ? next : getNext(val));
    }
    return getNext(next);
}

locateScalpel(bigOak).then(console.log);
// → Butcher's Shop
locateScalpel2(bigOak).then(console.log);
// → Butcher's Shop
