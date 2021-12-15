function runLevel(level, Display) {
	let display = new Display(document.body, level);
	let state = State.start(level);
	let ending = 1;
	let suspended = false;

	return new Promise(resolve => {
		function escHandler(event) {
			if (event.type == "keyup" && event.key == "Escape") {
				suspended = !suspended;
				event.preventDefault();

				if (!suspended) {
					runAnimation(frame);
				}
			}
		}

		window.addEventListener("keyup", escHandler);

		function frame(time) {
			if (suspended) return false;

			state = state.update(time, arrowKeys);
			display.syncState(state);

			if (state.status == "playing") {
				return true;
			}

			if (ending > 0) {
				ending -= time;
				return true;
			}

			display.clear();
			resolve(state.status);
			return false;
		}

		runAnimation(frame);
	});
}
