#!/usr/bin/awk -f

{
    hom_dom = $1
    hetero  = $2
    hom_rec = $3
    sum = $1 + $2 + $3
    prob_dom = hom_dom/sum + \
        hetero/sum * hom_dom/( sum-1) + \
        hetero/sum * (hetero-1)/(sum-1) * 0.75 + \
        hetero/sum * hom_rec/(sum-1) * 0.5 + \
        hom_rec/sum * hom_dom/(sum-1) + \
        hom_rec/sum * hetero/(sum-1) * 0.5
    print prob_dom
}
