#!/bin/bash

# Gets and associative array name and prints its contents
# Globals:
# Arguments:
#   - $1: Variable with the array name 
# Prints:
#   - Multiline string, each line shows item's key and value
function print_assoc {
    local -n items=$1                      # Reference the array
    local item_num="${#items[@]}"          # Count array items
    local cs=$(echo -n $item_num | wc -m)  # Column size for output numbers

    i=0;
    for key in "${!items[@]}"; do
      printf "%${cs}s [%s]=%s\n" "$((i+1))" "$key" "${items[$key]}"
      ((i++))
    done
}

# Array with star names and their distance from the sun in light years
declare -A array=( [sun]=0.000015813 [sirius]=8.6 [canopus]=310
    [rigil_kentaurus]=4.4 [toliman]=4.4 [arcturus]=37 [vega]=25
    [capella]=43 [rigel]=860 [procyon]=11 )

# Set the array name as plain text argument when calling the function
print_assoc array
