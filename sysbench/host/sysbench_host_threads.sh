
[ "$(whoami)" == "root" ] || { echo "Must be run as sudo!"; exit 1; }



for (( thr=1;  thr<=10000;  thr++ ))
do
	echo -e "*********"
	echo -e "Run $run"
	echo -e "*********\n"
	echo -e "Running CPU test...\n"

	ysbench --test=threads --num-threads=$thr --thread-yields=0 --max-requests=1000000 --thread-locks=1 run | grep 'total time:\|min:\|avg:\|max:' | tr -s [:space:]
	
	echo -e ""

done