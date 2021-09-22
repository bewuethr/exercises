function skipSpace(string) {
    let toRemove = string.match(/^(?:\s|#.*)*/);
    return string.slice(toRemove[0].length);
}
