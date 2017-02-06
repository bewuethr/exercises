specialForms["set"] = function(args, env) {
    if (args.length != 2 || args[0].type != "word")
        throw new SyntaxError("Bad use of set");
    var value = evaluate(args[1], env);
    while (env) {
        if (Object.prototype.hasOwnProperty.call(env, args[0].name)) {
            env[args[0].name] = value;
            return value;
        }
        env = Object.getPrototypeOf(env);
    }
    throw new ReferenceError("Can't set nonexisting variable " + args[0].name);
};
