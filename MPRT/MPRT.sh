#!/bin/bash

# Enable extended pattern matching
shopt -s extglob

# Regex for N-glycosylation motif without the leading 'N'
re='[^P][ST][^P]'

while IFS= read -r protein; do
    # grep -ob: for all matches, print byte offset
    locations="$(grep -Pob "N(?=$re)" <(
        # printf "X" because locations start at one, grep offsets at zero
        printf "X"
        # -Ls to follow redirection and get silent output
        curl -Ls http://www.uniprot.org/uniprot/"$protein".fasta |
        # Remove label information
        tail -n +2 |
        # Get everything on a single line
        tr -d $'\n'
    ))"

    # Non-empty if we've found the motif
    if [[ -n $locations ]]; then
        echo "$protein"
        # Replace actual matches with space
        loc_list="${locations//+([^0-9])/ }"
        # Remove extra space at end of line
        printf "%s\n" "${loc_list% }"
    fi
done < "$1"
