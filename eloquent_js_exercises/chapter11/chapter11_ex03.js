function skipSpace(string) {
    while (match = /^(\s+|#.*)/.exec(string))
        string = string.slice(match[0].length);
    return string;
}
