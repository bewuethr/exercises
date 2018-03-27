function skipSpace(string) {
    let toRemove = string.match(/(?:\s|#.*?\n)*/);
    return string.slice(toRemove[0].length);
}
