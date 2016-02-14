#!/bin/bash

while IFS= read -r line; do
    line="$(rev <<< "$line")"
    sed 'y/ACGT/TGCA/' <<< "$line"
done < <(cat "$@")
