function compareRobots(robot1, memory1, robot2, memory2) {
	const rounds = 100;
	let total1 = 0, total2 = 0;

	for (let i = 0; i < rounds; ++i) {
		let state = VillageState.random();
		total1 += getTurnCount(state, robot1, memory1);
		total2 += getTurnCount(state, robot2, memory2);
	}

	console.log(`robot1: ${total1 / rounds}\nrobot2: ${total2 / rounds}`)
}

function getTurnCount(state, robot, memory) {
	for (let turn = 0;; ++turn) {
		if (state.parcels.length == 0) return turn;

		let action = robot(state, memory);
		state = state.move(action.direction);
		memory = action.memory;
	}
}
