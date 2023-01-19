#!/bin/bash

# Gets an indexed array name and prints its contents
# Globals:
# Arguments:
#   - $1: Variable with the array name 
# Prints:
#   - Multiline string, each line shows item's index and value
function print_array {
    local -n items=$1                      # Reference the array
    local item_num="${#items[@]}"          # Count array items
    local cs=$(echo -n $item_num | wc -m)  # Column size for output numbers

    for (( i=0; i<$item_num; i++ )); do  
      printf "%${cs}s %s\n" "$((i+1))" "${items[$i]}"
    done
}

# Array with star names
declare -a array=( sun sirius canopus rigil_kentaurus
    toliman arcturus vega capella rigel procyon )

# Set the array name as plain text argument when calling the function
print_array array
