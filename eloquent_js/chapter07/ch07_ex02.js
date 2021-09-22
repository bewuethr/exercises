function getTurnCount(state, robot, memory) {
    for (let turn = 0;; turn++) {
        if (state.parcels.length == 0 || turn > 50) {
            return turn;
        }
        let action = robot(state, memory);
        state = state.move(action.direction);
        memory = action.memory;
    }
}

function compareRobots(robot1, memory1, robot2, memory2) {
    let total1 = 0, total2 = 0, reps = 10000;
    for (let i = 0; i < reps; ++i) {
        let initState = VillageState.random();
        total1 += getTurnCount(initState, robot1, memory1);
        total2 += getTurnCount(initState, robot2, memory2);
    }
    console.log(`${robot1.name}: ${total1 / reps}\n` +
                `${robot2.name}: ${total2 / reps}`);
}

function myRobot({place, parcels}, route) {
    if (route.length == 0) {
        // Select locations of parcels we current don't carry
        let places = parcels.filter(p => p.place != place).map(p => p.place);

        // Select addresses of parcels we currently carry
        let addresses = parcels.filter(p => p.place == place).map(p => p.address);

        let minLen = Infinity;
        // Loop over destinations; checking parcels to pick up first guarantees
        // that for multiple routes with same length, we'll prefer the one that
        // picks up a parcel
        for (let destination of places.concat(addresses)) {
            parcelRoute = findRoute(roadGraph, place, destination);
            if (parcelRoute.length < minLen) {
                route = parcelRoute;
                minLen = route.length;
            }
        }
    }
    return {direction: route[0], memory: route.slice(1)};
}

compareRobots(goalOrientedRobot, [], myRobot, []);

runRobotAnimation(VillageState.random(), myRobot, []);
