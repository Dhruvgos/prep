#!/bin/bash

name="Dhruv"
role="$1"

bad_func(){
	role="ASE"	
}

good_func(){
	local role="SE-1"
}	

greet(){
	echo "Hi $name,you are $role"
}

good_func
greet
