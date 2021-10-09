function withBoxUnlocked(body) {
	let wasLocked = box.locked;
	try {
		if (wasLocked) {
			box.unlock();
		}
		body();
	} finally {
		if (wasLocked) {
			box.lock();
		}
	}
}
