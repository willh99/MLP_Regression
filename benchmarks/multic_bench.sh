#!/bin/bash

#Option to overwrite previous statistical data
echo "//////////////////////////////////////////////////////////////" >> multic_res.txt
read -p "Would you like to overwrite the previous contents of multi_res.txt? [y/n]" answr

case $answr in
  y|Y|yes|Yes)
    printf "deleting now\n\n"
    >multic_res.txt
  ;;
  n|N|no|No)
    printf "skipping deletion\n\n"
  ;;
  *)
    echo "invalid input"
    exit 1
esac

#Running impi test and perf test in parallel
#Scans stats every .4 seconds for 16 seconds

for j in `seq 1 40`; do
  for i in `seq 1 40`; do

    sudo ipmitool sdr type Current | grep System > /tmp/temp1.txt &
    sudo perf stat -e LLC-loads,LLC-load-misses,LLC-stores,LLC-store-misses,dTLB-loads,dTLB-load-misses,dTLB-stores,dTLB-store-misses -a sleep .4 2> /tmp/temp2.txt &
    wait
    cat /tmp/temp{1,2}.txt >> multic_res.txt
    rm /tmp/temp{1,2}.txt

  done
  printf "$j"
done

echo "perf and impi diagnostics complete"
echo "results saved in multi_res.txt"
