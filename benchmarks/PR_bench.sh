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

echo "Initiating RAPL power_read diagnostics"
echo "Tracking power consumption in watts"

for i in `seq 1 200`; do

  sudo ../power_reader 1 >> power.txt
  printf "$i"
done

echo "Power diagnostics complete"
echo "results saved in power.txt"
