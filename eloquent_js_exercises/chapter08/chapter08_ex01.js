function reliableMultiply(a, b) {
    for (;;) {
        try {
            return primitiveMultiply(a, b);
        } catch (error) {
            if  (error instanceof MultiplicatorUnitFailure) {
                console.log("MultiplicatorUnitFailure caught");
            } else {
                throw error;
            }
        }
    }
}
