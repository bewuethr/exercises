#!/usr/bin/awk -f

{
    getline substring
    offset = 0
    while (1) {
        idx = index(substr($0, offset+1), substring) 
        if (idx == 0)
            break
        printf("%d ", idx + offset)
        offset += idx
    }
    print ""
}
