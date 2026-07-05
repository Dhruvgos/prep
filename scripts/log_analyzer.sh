#!/bin/bash

check_error(){
	
	local line="$1"

	if [[ "$line" == *ERROR* ]]; then
        return 0
    else
        return 1
    fi


}	

declare -A errors

while read line
do 
	if check_error "$line"; then
		service=$(echo "$line" |awk '{print $4}')
		((errors["$service"]++))
	fi;
done<text.log	

max=0
winner=""

for key in "${!errors[@]}"
do
    echo "$key : ${errors[$key]}"
    if (( max<${errors[$key]} )); then
	    max=${errors[$key]}
		winner="$key"
	fi		
done

echo "Max service giving Error : is $winner with $max error"
