#!/bin/bash
# Benchmarking using linux perf

#Option to overwrite previous statistical data
echo "//////////////////////////////////////////////////////////" >> perf_res.txt
read  -p "Would you like to overwrite the previous contents of perf_res.txt [y/n]" answr

case $answr in
  y|Y|yes|Yes)
    printf "deleting now\n\n"
    >perf_res.txt
  ;;
  n|N|no|No)
    printf "skipping deletion\n\n"
  ;;
  *)
    echo "invalid input"
    exit 1
esac

#Perf commands for gathering metrics
#Two commands are used to avoid multiplexing. Server has 4 perf counters
#command loops 40 times for 200 seconds (5 sec/sample)

echo "Initiating Linux perf diagnostics"
echo "Counting cycles, instructions, cache-ref, and cache misses,branches, branch-misses, and page-faults"
echo "perf running at frequency of 200 milliseconds for 200 seconds"

for i in `seq 1 1000`; do

  sudo perf stat -e cycles,instructions,cache-references,cache-misses,branches,branch-misses,page-faults -a sleep .2 2>>perf_res.txt

  printf "$i"
done

echo "perf diagnostics complete"
echo "results saved in perf_res.txt"
