#!/usr/bin/awk -f

{
    protein = ""
    flag = 0    # Get rid of line with label
    while (("curl -Ls http://www.uniprot.org/uniprot/"$1".fasta" | getline prot_line) > 0) {
        if (flag)
            # Append line to protein
            protein = protein prot_line
        else
            # We're on the first line - ignore label and set flag
            flag = 1
    }

    first = 1    # Print label only once
    startidx = 1
    do {
        where = match(substr(protein, startidx), /N[^P][ST][^P]/)
        if (where != 0) {
            if (first) {
                # Print label, start location string
                print $0
                loc_string = where + startidx - 1
                # Reset flag
                first = 0
            }
            else {
                # Append to location string
                loc_string = loc_string " " where + startidx - 1
            }
            # Update offset: start one after start of last match
            startidx += where
        }
    } while (where != 0)

    # Did we find something?
    if (loc_string)
        print loc_string
}
