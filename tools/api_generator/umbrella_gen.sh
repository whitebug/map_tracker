#! /bin/bash

pathToDTOFolder=$1
nameOfTheUmbrella=$2

fileNames=()

filter=".g.dart"

# remove old umbrella file
# to exclude it from file reading (the simpliest way)

rm -f "$nameOfTheUmbrella"

# Read all files from directory with DTO model
# and save their names (with extensions) into `fileNames` array

# shellcheck disable=SC2231
for file in ${pathToDTOFolder}/*
do
    nameAndExt=${file##*/}
    if [[ "$nameAndExt" != *"$filter"* ]]; then
        # shellcheck disable=SC2206
        fileNames+=($nameAndExt)
    fi
done

# write new umbrella

# shellcheck disable=SC2068
for value in ${fileNames[@]}
do
    # shellcheck disable=SC2034
    name=${value%.*}
    echo "export '$value';" >> "$nameOfTheUmbrella"
done