
[ "$(whoami)" == "root" ] || { echo "Must be run as sudo!"; exit 1; }



for (( mem=1;  mem<=100;  mem++ ))
do
	echo -e "*********"
	echo -e "Run $run"
	echo -e "*********\n"
	echo -e "Running CPU test...\n"

	sysbench --test=memory --memory-block-size=$memM --memory-total-size=16 run
 | grep 'total time:\|min:\|avg:\|max:' | tr -s [:space:]
	
	echo -e ""

done