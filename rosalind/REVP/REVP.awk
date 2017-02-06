#!/usr/bin/awk -f

# Generate reverse complement of input string
function rev_compl(str,   str_mod) {
    # Reverse string
    for (i = length(str); i >= 1; --i)
        str_mod = str_mod substr(str, i, 1)

    # Get complement of string
    gsub("T", "X", str_mod)
    gsub("A", "T", str_mod)
    gsub("X", "A", str_mod)
    gsub("G", "X", str_mod)
    gsub("C", "G", str_mod)
    gsub("X", "C", str_mod)

    return str_mod
}


BEGIN {
    # Set record separator to label line
    RS = ">[^\n]+\n"
}

NR > 1 {
    # Remove newlines
    gsub("\n", "")

    # Loop over input string
    for (idx = 1; idx <= length($0) - 3; ++idx) {
        # Loop over candidate lengths
        for (len = 4; len <= 12; len += 2) {
            # Make sure length fits into input string
            if (idx + len - 1 <= length($0)) {
                cand_str = substr($0, idx, len)
                # Is it a reverse palindrome?
                if (cand_str == rev_compl(cand_str)) {
                    print idx, len
                }
            }
        }
    }
}
