var text = "'I'm the cook,' he said, 'it's my job.'";

console.log(
        text.replace(/([a-z])'([a-z])/gi, "$1~~$2")
        .replace(/'/g, "\"")
        .replace(/~~/g, "'"));
