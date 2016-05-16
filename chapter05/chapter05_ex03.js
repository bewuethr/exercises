var agePerCentury = {};

ancestry.forEach(function(person) {
    var century = Math.ceil(person.died / 100);
    if (!(century in agePerCentury))
        agePerCentury[century] = [];

    agePerCentury[century].push(person.died - person.born);
});

for (var century in agePerCentury)
    console.log(century + ": " + average(agePerCentury[century]));

// Or, alternatively, for bonus points

function groupBy(array, groupFunc) {
    var mapping = {};
    array.forEach(function(element) {
        var mapped = groupFunc(element);
        if (!(mapped in mapping))
            mapping[mapped] = [];

        mapping[mapped].push(element);
    });
    return mapping;
}

var byCentury = groupBy(ancestry, function(person) {
    return Math.ceil(person.died / 100);
});

for (var century in byCentury) {
    var ages = byCentury[century].map(function(person) {
        return person.died - person.born;
    });
    console.log(century + ": " + average(ages));
}
