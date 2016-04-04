#!/usr/bin/awk -f

# Translate an RNA sequence to a protein
function translate_frame(seq,   protein) {
    while (1) {
        acid = ct[substr(seq, 1, 3)]

        # Are we done?
        if (acid == "Stop") {
            unique_proteins[protein] = 1    # Avoid duplicate results
            return
        }
        protein = protein acid
        seq = substr(seq, 4)

        # Was there no stop codon?
        if (length(seq) < 3)
            return
    }
}

BEGIN {
    # RNA codon table
    ct["UUU"] = "F";      ct["CUU"] = "L";      ct["AUU"] = "I";      ct["GUU"] = "V"  
    ct["UUC"] = "F";      ct["CUC"] = "L";      ct["AUC"] = "I";      ct["GUC"] = "V"
    ct["UUA"] = "L";      ct["CUA"] = "L";      ct["AUA"] = "I";      ct["GUA"] = "V"
    ct["UUG"] = "L";      ct["CUG"] = "L";      ct["AUG"] = "M";      ct["GUG"] = "V"
    ct["UCU"] = "S";      ct["CCU"] = "P";      ct["ACU"] = "T";      ct["GCU"] = "A"
    ct["UCC"] = "S";      ct["CCC"] = "P";      ct["ACC"] = "T";      ct["GCC"] = "A"
    ct["UCA"] = "S";      ct["CCA"] = "P";      ct["ACA"] = "T";      ct["GCA"] = "A"
    ct["UCG"] = "S";      ct["CCG"] = "P";      ct["ACG"] = "T";      ct["GCG"] = "A"
    ct["UAU"] = "Y";      ct["CAU"] = "H";      ct["AAU"] = "N";      ct["GAU"] = "D"
    ct["UAC"] = "Y";      ct["CAC"] = "H";      ct["AAC"] = "N";      ct["GAC"] = "D"
    ct["UAA"] = "Stop";   ct["CAA"] = "Q";      ct["AAA"] = "K";      ct["GAA"] = "E"
    ct["UAG"] = "Stop";   ct["CAG"] = "Q";      ct["AAG"] = "K";      ct["GAG"] = "E"
    ct["UGU"] = "C";      ct["CGU"] = "R";      ct["AGU"] = "S";      ct["GGU"] = "G"
    ct["UGC"] = "C";      ct["CGC"] = "R";      ct["AGC"] = "S";      ct["GGC"] = "G"
    ct["UGA"] = "Stop";   ct["CGA"] = "R";      ct["AGA"] = "R";      ct["GGA"] = "G"
    ct["UGG"] = "W";      ct["CGG"] = "R";      ct["AGG"] = "R";      ct["GGG"] = "G" 

    # Set record separator to label line
    RS = ">[^\n]+\n"
}

NR > 1 {
    # Remove newlines
    gsub("\n", "")

    # Transcription into RNA
    gsub("T", "U")

    # Create reverse string
    for (i = length($0); i >= 1; --i)
        rev_seq = rev_seq substr($0, i, 1)

    # Get complement of reverse string
    gsub(/A/, "X", rev_seq)
    gsub(/U/, "A", rev_seq)
    gsub(/X/, "U", rev_seq)
    gsub(/C/, "X", rev_seq)
    gsub(/G/, "C", rev_seq)
    gsub(/X/, "G", rev_seq)

    seqs[1] = $0
    seqs[2] = rev_seq

    for (i in seqs) {
        # Initial start location
        idx = index(seqs[i], "AUG")
        abs_idx = idx   # Refers to complete string
        while (idx != 0) {
            translate_frame(substr(seqs[i], abs_idx))
            idx = index(substr(seqs[i], abs_idx + 1), "AUG")
            abs_idx += idx
        }
    }
}

# Print results
END {
    for (protein in unique_proteins)
        print protein
}
