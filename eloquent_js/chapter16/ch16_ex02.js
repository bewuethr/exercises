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
		const arrowKeys = trackKeys(["ArrowLeft", "ArrowRight", "ArrowUp"]);

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
			window.removeEventListener("keyup", escHandler);
			arrowKeys.unregister();
			return false;
		}

		runAnimation(frame);
	});
}

function trackKeys(keys) {
	let down = Object.create(null);

	function track(event) {
		if (keys.includes(event.key)) {
			down[event.key] = event.type == "keydown";
			event.preventDefault();
		}
	}
	window.addEventListener("keydown", track);
	window.addEventListener("keyup", track);

	down.unregister = function() {
		window.removeEventListener("keydown", track);
		window.removeEventListener("keyup", track);
	}

	return down;
}
