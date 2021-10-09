function withBoxUnlocked(body) {
	let wasLocked = box.locked;
	try {
		box.unlock();
		body();
	} finally {
		if (wasLocked) {
			box.lock();
		}
	}
}
