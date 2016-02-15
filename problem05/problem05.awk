#!/usr/bin/awk -f

/^>/ {
    if (seq_id != "")
        gc_contents[seq_id] = 100 * gc_el / tot_el
    tot_el = 0
    gc_el = 0
    seq_id = substr($0, 2)
    next
}

{
    line_el = split($0, arr, "")
    tot_el += line_el
    for (idx in arr)
        if (arr[idx] == "G" || arr[idx] == "C")
            ++gc_el
}

END {
    gc_contents[seq_id] = 100 * gc_el / tot_el
    for (id in gc_contents) {
        if (gc_contents[id] > max_content) {
            max_id = id
            max_content = gc_contents[id]
        }
    }
    printf("%s\n%g\n", max_id, max_content)
}

