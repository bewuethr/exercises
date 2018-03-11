function getTurnCount(state, robot, memory) {
    for (let turn = 0;; turn++) {
        if (state.parcels.length == 0) {
            return turn;
        }
        let action = robot(state, memory);
        state = state.move(action.direction);
        memory = action.memory;
    }
}

function compareRobots(robot1, memory1, robot2, memory2) {
    let total1 = 0, total2 = 0, reps = 100;
    for (let i = 0; i < reps; ++i) {
        let initState = VillageState.random();
        total1 += getTurnCount(initState, robot1, memory1);
        total2 += getTurnCount(initState, robot2, memory2);
    }
    console.log(`${robot1.name}: ${total1 / reps}\n` +
                `${robot2.name}: ${total2 / reps}`);
}
