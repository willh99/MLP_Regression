#!/bin/bash
# Benchmarking using linux perf

#Option to overwrite previous statistical data
echo "//////////////////////////////////////////////////////////" >> perfc_res.txt
read  -p "Would you like to overwrite the previous contents of perfc_res.txt [y/n]" answr

case $answr in
  y|Y|yes|Yes)
    printf "deleting now\n\n"
    >perfc_res.txt
  ;;
  n|N|no|No)
    printf "skipping deletion\n\n"
  ;;
  *)
    echo "invalid input"
    exit 1
esac

#Perf commands for gathering metrics
#Server has 4 perf counters so counts are multiplexed
#Command loops 1000 times for 200 seconds (5 samples/sec)

echo "Initiating Linux perf diagnostics"
echo "Counting LLC loads, load-misses, stores, and store-misses and dTLB loads, load-misses, stores, and store-misses"
echo "perf running at frequency of 200 milliseconds for 200 seconds"

for i in `seq 1 1000`; do

  sudo perf stat -e LLC-loads,LLC-load-misses,LLC-stores,LLC-store-misses,dTLB-loads,dTLB-load-misses,dTLB-stores,dTLB-store-misses -a sleep .2 2>>perfc_res.txt

  printf "$i"
done

echo "perf diagnostics complete"
echo "results saved in perfc_res.txt"
