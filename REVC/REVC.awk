#!/usr/bin/awk -f

{
    # Reverse string
    for (i = length(); i > 0; --i)
        tmpline = tmpline substr($0, i, 1)
    
    # Get complement of string
    gsub(/A/, "X", tmpline)
    gsub(/T/, "A", tmpline)
    gsub(/X/, "T", tmpline)
    gsub(/C/, "X", tmpline)
    gsub(/G/, "C", tmpline)
    gsub(/X/, "G", tmpline)
    print tmpline
}
