#!/bin/bash

#Power statistics gathered from ipmitool's System Usage sensor

echo "//////////////////////////////////////////////////////////" >> power.txt
read  -p "Would you like to overwrite the previous contents of power.txt [y/n]" answr

case $answr in
  y|Y|yes|Yes)
    printf "deleting now\n\n"
    >power.txt
  ;;
  n|N|no|No)
    printf "skipping deletion\n\n"
  ;;
  *)
    echo "invalid input"
    exit 1
esac

echo "Initiating impitool sdr diagnostics"
echo "Tracking power consumption in watts"
echo "perf running at frequency of 200 milliseconds for 200 seconds (5 samples/sec"

for i in `seq 1 1000`; do

  sudo ipmitool sdr type Current | grep System >> power.txt
  sleep .2
  printf "$i"
done

echo "Power diagnostics complete"
echo "results saved in power.txt"
