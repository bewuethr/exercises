#!/usr/bin/awk -f

{
    for (i = 1; i <= $1; ++i) {
        if (i == 1) {
            F_cur = 1
            continue
        }
        if (i == 2) {
            F_prev = F_cur
            F_cur = 1
            continue
        }
        F_new = F_cur + $2 * F_prev
        F_prev = F_cur
        F_cur = F_new
    }
    print F_cur
}
