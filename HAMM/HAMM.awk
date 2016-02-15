#!/usr/bin/awk -f

{
    split($0, arr1, "")
    getline mutation
    split(mutation, arr2, "")
    for (idx in arr1)
        if (arr1[idx] != arr2[idx])
            ++hamm_dist
    print hamm_dist
}
