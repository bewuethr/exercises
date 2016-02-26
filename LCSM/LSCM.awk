#!/usr/bin/awk -f

BEGIN {
    RS = ">[^\n]+\n"
}

NR == 2 {
    min_len = length()
    shortest = $0
}

NR > 1 {
    gsub(/\n/, "")
    dna_strings[rt] = $0

    if (NR == 2) {
        min_len = length()
        shortest = $0
    }

    if (NR > 2) {
        shortest = length() < min_len ? $0 : shortest
        min_len = length() < min_len ? length() : min_len
    }
}

{
    rt = RT
    gsub(/>|\n/, "", rt)
}

END {
    # Start with full length of shortest string

    # Loop over string lengths: full string down to single letter
    for (len = min_len; len >= 1; --len) {
        # Loop over start: none up to difference of current and full length
        for (idx = 1; idx <= min_len - len + 1; ++idx) {
            candidate = substr(shortest, idx, len)

            # Loop over all strings
            found = 1
            for (seq in dna_strings) {
                if (index(dna_strings[seq], candidate) == 0) {
                    found = 0
                    break
                }
            }
            if (found) {
                print candidate
                exit
            }
        }
    }
}

