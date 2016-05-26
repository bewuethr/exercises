function SmartPlantEater() {
    this.energy = 20;
    this.dir = "s";
}
SmartPlantEater.prototype.act = function(view) {
    var space = view.find(" ");
    if (this.energy > 60 && space)
        return {type: "reproduce", direction: space};
    var plants = view.findAll("*");

    // Only eat plants if there will be at least one left afterwards
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
