var ages = ancestry.map(function(person) {
    if (person.mother in byName)
        return person.born - byName[person.mother].born;
    else
        return null;
}).filter(function(age) {
    return age !== null;
});

console.log(average(ages));
