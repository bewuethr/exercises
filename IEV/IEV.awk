#!/usr/bin/awk -f

{
    # Expected number with dominant phenotype
    expected = $1 * 2 + \
          $2 * 2 + \
          $3 * 2 + \
          $4 * 1.5 + \
          $5

    print expected
}
