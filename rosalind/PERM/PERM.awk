#!/usr/bin/awk -f

function factorial(n,   res, i) {
    res = 1
    for (i = 2; i <=n; ++i)
        res *= i
    return res
}

function print_arr(arr,   str, i) {
    str = arr[1]
    for (i = 2; i <= length(arr); ++i)
        str = str " " arr[i]
    print str
}

function swap(arr, idx1, idx2,    temp) {
    temp = arr[idx1]
    arr[idx1] = arr[idx2]
    arr[idx2] = temp
}

function generate(N,   arr, c, n, idx) {
    for (n = 1; n <= N; ++n) {
        arr[n] = n
        c[n] = 1
    }

    print_arr(arr)

    n = 2
    while (n <= N) {
        if (c[n] < n) {
            if (n % 2 == 0)
                idx = c[n]
            else
                idx = 1
            swap(arr, idx, n)
            ++c[n]
            n = 2
            print_arr(arr)
        }
        else
            c[n++] = 1
    }
}

{
    print factorial($0)
    generate($0)
}
