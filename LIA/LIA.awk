#!/usr/bin/awk -f

function factorial(n,     fac, i) {
    fac = n
    for (i = n-1; i >= 2; --i)
        fac *= i
    return fac
}

function choose(n, k,      i, prod) {
    prod = n
    for (i = n - 1; i >= n - k + 1; --i)
        prod *= i
    return prod / factorial(k)
}

{
    k = $1  # Number of generations
    N = $2  # At least this many Aa Bb organisms
    for (i = N; i <= 2^k; ++i)
        prob += choose(2^k, i) * (1/4)^i * (3/4)^(2^k-i)
    print prob
}
