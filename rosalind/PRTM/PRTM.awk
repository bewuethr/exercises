#!/usr/bin/awk -f

BEGIN {
    # Monoisotopic mass table
    mass["A"] = 71.03711
    mass["C"] = 103.00919
    mass["D"] = 115.02694
    mass["E"] = 129.04259
    mass["F"] = 147.06841
    mass["G"] = 57.02146
    mass["H"] = 137.05891
    mass["I"] = 113.08406
    mass["K"] = 128.09496
    mass["L"] = 113.08406
    mass["M"] = 131.04049
    mass["N"] = 114.04293
    mass["P"] = 97.05276
    mass["Q"] = 128.05858
    mass["R"] = 156.10111
    mass["S"] = 87.03203
    mass["T"] = 101.04768
    mass["V"] = 99.06841
    mass["W"] = 186.07931
    mass["Y"] = 163.06333 
}

{
    split($0, arr, "")
    
    for (i in arr)
        weight += mass[arr[i]]

    printf "%.3f\n", weight
}
