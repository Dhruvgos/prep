#!/bin/bash


confirm(){

	local prompt="$1"
	local resp

	while true; do
	     read -p "$prompt [y/n]: " resp
       		case "$resp" in
			[Y/y]|[Y/y][E/e][S/s]) return 0;;
	[N/n]|[N/n][O/o]) return 1;;
		*) echo "ENter valid option";;
		esac
	done	

}	

#if confirm "Deploy to prod"; then
#	echo "Deploying to prod";
#else 
#	echo "Cancelled";
#	exit 1;
#fi


select opt in prod stag cancel;do
	case "$opt" in
	"stag") echo "Deploying to stag"
		break
		;;

	"prod")	if confirm "are u sure u want to deploy?"; then
       		echo "Deploying to prod";
		else
		echo "Cancelled";
		fi	
		break
		;;

	"quit") 
		exit 0	
		;;

	*) 
		echo "Enter valid option"
		;;
esac
done
