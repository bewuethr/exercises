#!/usr/bin/awk -f

function get_max(arr) {
    PROCINFO["sorted_in"] = "@val_num_desc"
    for (base in arr)
        return base
}

BEGIN {
    RS = ">[^\n]*\n"
}

{
    # Remove newlines
    gsub(/\n/, "")

    # Read into array
    n = split($0, arr, "")

    # Populate profile matrix
    for (i in arr)
        ++prof_matrix[arr[i]][i]
}

END {
    # Print consensus string
    for (i = 1; i <= length(arr); ++i) {
        for (base in prof_matrix) {
            vals[base] = prof_matrix[base][i]
        }
        printf("%c", get_max(vals))
    }
    print ""

    # Print profile matrix
    PROCINFO["sorted_in"] = "@ind_str_asc"
    for (base in prof_matrix) {
        printf("%s: ", base)
        for (i = 1; i < length(arr); ++i) {
            printf("%d ", prof_matrix[base][i])
        }
        # Print last entry without space after it
        printf("%d\n", prof_matrix[base][length(arr)])
    }
}
