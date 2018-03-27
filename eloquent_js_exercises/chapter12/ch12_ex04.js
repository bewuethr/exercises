specialForms.set = (args, scope) => {
    if (args.length != 2 || args[0].type != "word") {
        throw new SyntaxError("Incorrect use of set");
    }
    let curScope = scope;

    // Would be nicer with a for loop to change scope
    while (!Object.prototype.hasOwnProperty.call(curScope, args[0].name)) {
        curScope = Object.getPrototypeOf(curScope);

        // Could probably use (!curScope) instead
        if (curScope === null) {
            throw new ReferenceError("Can't set non-existing binding " +
                                     `'${args[0].name}'`);
        }
    }
    let value = evaluate(args[1], scope);
    curScope[args[0].name] = value;
    return value;
}
