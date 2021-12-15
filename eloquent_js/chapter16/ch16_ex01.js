async function runGame(plans, Display) {
	let lives = 3;
	for (let level = 0; level < plans.length;) {
		console.log(lives, lives > 1 ? "lives": "life", "left");
		let status = await runLevel(new Level(plans[level]), Display);

		if (status == "won") ++level;
		else --lives;

		if (lives == 0) level = 0;
	}
	console.log("You've won!");
}
