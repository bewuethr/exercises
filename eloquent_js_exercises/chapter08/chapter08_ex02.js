function withBoxUnlocked(body) {
    var relock = false;
    if (box.locked) {
        box.unlock();
        relock = true;
    }

    try {
        return body();
    }
    finally {
        if (relock)
            box.lock();
    }
}
