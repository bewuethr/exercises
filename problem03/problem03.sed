#!/usr/bin/sed -rf

s/^.*$/\n&\n/
:x
s/(\n.)(.*)(.\n)/\3\2\1/
tx
s/\n//g
y/ACGT/TGCA/
