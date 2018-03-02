verify(/ca[rt]/,
        ["my car", "bad cats"],
        ["camper", "high art"]);

verify(/pr?op/,
        ["pop culture", "mad props"],
        ["plop"]);

verify(/ferr[et|y|ari]/,
        ["ferret", "ferry", "ferrari"],
        ["ferrum", "transfer A"]);

verify(/ious\b/,
        ["how delicious", "spacious room"],
        ["ruinous", "consciousness"]);

verify(/\s[.,:;]/,
        ["bad punctuation ."],
        ["escape the dot"]);

verify(/\w{7,}/,
        ["hottentottententen"],
        ["no", "hotten totten tenten"]);

verify(/\b[^e ]+\b/,
        ["red platypus", "wobbling nest"],
        ["earth bed", "learning ape"]);
