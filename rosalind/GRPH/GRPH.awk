#!/usr/bin/awk -f

function overlaps(first, second, common) {
    if (substr(first, length(first)-common+1, common) == \
      substr(second, 1, common)) {
        return 1
    }
    else {
        return 0
    }
}

BEGIN {
    RS = ">[^\n]+\n"
}

NR > 1 {
    gsub(/\n/, "")
    dna_strings[rt] = $0
}

{
    rt = RT
    gsub(/>|\n/, "", rt)
}

END {
    overlap = 3
    for (string1 in dna_strings) {
        for (string2 in dna_strings) {
            if (string1 == string2) {
                continue
            }
            if (overlaps(dna_strings[string1], dna_strings[string2], overlap)) {
                print string1, string2
            }
        }
    }
}
