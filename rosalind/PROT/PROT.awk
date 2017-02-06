#!/usr/bin/awk -f

BEGIN {
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
}

{
    patsplit($0, pstr_arr, /.../)
    for (idx in pstr_arr) {
        if (ct[pstr_arr[idx]] == "Stop")
            break
        pstr = pstr ct[pstr_arr[idx]]
    }
    print pstr
}
