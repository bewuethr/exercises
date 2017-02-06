#!/usr/bin/awk -f

{
    len = split($0, arr, "")
    for (i = 1; i <= len; ++i)
        count[arr[i]]++
}
END {
    print count["A"], count["C"], count["G"], count["T"]
}
