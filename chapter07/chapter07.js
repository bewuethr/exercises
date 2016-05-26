// Exercise 1
function SmartPlantEater() {
    this.energy = 20;
    this.dir = "s";
}
SmartPlantEater.prototype.act = function(view) {
    var space = view.find(" ");
    if (this.energy > 60 && space)
        return {type: "reproduce", direction: space};

    // Only eat plants if there will be at least one left afterwards
    var plants = view.findAll("*");
    if (plants.length > 1)
        return {type: "eat", direction: plants[0]};

    // WallFollower style movement
    if (space) {
        var start = this.dir;
        if (view.look(dirPlus(this.dir, -3)) != " ")
            start = this.dir = dirPlus(this.dir, -2);
        while (view.look(this.dir) != " ") {
            this.dir = dirPlus(this.dir, 1);
            if (this.dir == start) break;
        }
        return {type: "move", direction: this.dir};
    }
};

// Exercise 2

function Tiger() {
    this.energy = 50;
    this.direction = randomElement(directionNames);
    this.preyContacts = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
}
Tiger.prototype.act = function(view) {
    var space = view.find(" ");
    if (this.energy > 100 && space)
        return {type: "reproduce", direction: space};

    // Update array of number of prey seen in the last 10 rounds
    this.preyContacts.shift();
    this.preyContacts.push(view.findAll("O").length);
    var preyCount = this.preyContacts.reduce(function(a, b) {
        return a+b;
    });
    var prey = view.find("O");

    // Only eat if energy is low or prey count high
    if (prey && (this.energy < 40 || preyCount > 0))
        return {type: "eat", direction: prey};

    if (space) {
        if (view.look(this.direction) != " ")
            this.direction = space;
        return {type: "move", direction: this.direction};
    };
}
