function reliableMultiply(a, b) {
	for (;;) {
		try {
			primitiveMultiply(a, b);
			break;
		} catch(e) {
			if (!e instanceof MultiplicatorUnitFailure) {
				throw e;
			}
		}
	}
}
