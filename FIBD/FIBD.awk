#!/usr/bin/awk -Mf

# Notice -M option for arbitrary precision integer arithmetic

{
    n_months = $1
    max_age = $2

    rabbits[1] = 1

    for (month = 2; month <= n_months; ++month) {
        newborns = 0
        for (age = max_age; age >= 2; --age) {
            newborns += rabbits[age]
            rabbits[age] = rabbits[age-1]
        }
        rabbits[1] = newborns
    }

    for (age = 1; age <= max_age; ++age)
        sum += rabbits[age]

    print sum
}
