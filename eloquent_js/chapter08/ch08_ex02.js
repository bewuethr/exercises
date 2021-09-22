function withBoxUnlocked(body) {
    let wasLocked = box.locked;
    if (wasLocked) {
        box.unlock();
    }
    try {
        return body();
    } finally {
        if (wasLocked) {
            box.lock();
        }
    }
}
