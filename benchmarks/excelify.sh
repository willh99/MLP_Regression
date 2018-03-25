#!/bin/bash

#This script takes that data collected in perf_bench.sh and
#converts it to a tab delimited text format which can be 
#easily fed to excel for the purposes of graphing

echo "Which document would you like to excelify?"
echo "1. perf_res.txt"
echo "2. power.txt"
echo "3. perfc_res.txt"
echo "4. multi_res.txt"
echo "5. multic_res.txt"

read answr

case $answr in
  1 | perf_res.txt)
    echo "Now formatting perf_res.txt"
    cat perf_res.txt | perl -pe 's{branches}{++$n % 2 ? "BRANCHES" : $&}ge' > perf_ex.txt

    awk '/cycles/ {print $1;}' perf_ex.txt > cycles.txt
    sed -i '1s/^/cycles\n/' cycles.txt

    awk '/instructions/ {print $1;}' perf_ex.txt > instructions.txt
    sed -i '1s/^/instructions\n/' instructions.txt

    awk '/references/ {print $1;}' perf_ex.txt > references.txt
    sed -i '1s/^/cache-references\n/' references.txt

    awk '/cache-misses/ {print $1;}' perf_ex.txt > cache-misses.txt
    sed -i '1s/^/cache-misses\n/' cache-misses.txt

    awk '/BRANCHES/ {print $1;}' perf_ex.txt > branches.txt
    sed -i '1s/^/branches\n/' branches.txt

    awk '/branch-misses/ {print $1;}' perf_ex.txt > branch-misses.txt
    sed -i '1s/^/branch-misses\n/' branch-misses.txt

    awk '/page/ {print $1;}' perf_ex.txt > page-faults.txt
    sed -i '1s/^/page-faults\n/' page-faults.txt

    awk '/seconds/ {print $1;}' perf_ex.txt > seconds.txt
    sed -i '1s/^/seconds\n/' seconds.txt


    paste cycles.txt instructions.txt references.txt cache-misses.txt branches.txt branch-misses.txt page-faults.txt seconds.txt | column -s $'\t' -tx > final_data/mahout_perf1.txt

    rm cycles.txt instructions.txt references.txt cache-misses.txt branches.txt branch-misses.txt page-faults.txt seconds.txt
  ;;
  2 | power.txt)
    echo "Now formatting power.txt"
    awk '/System/ {print $10;}' power.txt > final_data/expower.txt
    sed -i '1s/^/Power\n/' final_data/expower.txt

  ;;
  3 | perfc_res.txt)
    echo "Now formatting perfc_res.txt"
   
    awk '/LLC-loads/ {print $1;}' perfc_res.txt > LLC_l.txt
    sed -i '1s/^/LLC-loads\n/' LLC_l.txt

    awk '/LLC-load-miss/ {print $1;}' perfc_res.txt > LLC_lm.txt
    sed -i '1s/^/LLC-load-misses\n/' LLC_lm.txt

    awk '/LLC-stores/ {print $1;}' perfc_res.txt > LLC_s.txt
    sed -i '1s/^/LLC-stores\n/' LLC_s.txt

    awk '/LLC-store-miss/ {print $1;}' perfc_res.txt > LLC_sm.txt
    sed -i '1s/^/LLC-store-misses\n/' LLC_sm.txt

    awk '/dTLB-loads/ {print $1;}' perfc_res.txt > dTLB_l.txt
    sed -i '1s/^/dTLB-loads\n/' dTLB_l.txt

    awk '/dTLB-load-miss/ {print $1;}' perfc_res.txt > dTLB_lm.txt
    sed -i '1s/^/dTLB-load-misses\n/' dTLB_lm.txt

    awk '/dTLB-stores/ {print $1;}' perfc_res.txt > dTLB_s.txt
    sed -i '1s/^/dTLB-stores\n/' dTLB_s.txt

    awk '/dTLB-store-miss/ {print $1;}' perfc_res.txt > dTLB_sm.txt
    sed -i '1s/^/dTLB-store-misses\n/' dTLB_sm.txt

    awk '/seconds/ {print $1;}' perfc_res.txt > seconds.txt
    sed -i '1s/^/seconds\n/' seconds.txt 

    paste LLC_l.txt LLC_lm.txt LLC_s.txt LLC_sm.txt dTLB_l.txt dTLB_lm.txt dTLB_s.txt dTLB_sm.txt seconds.txt | column -s $'\t' -tx >> final_data/elastic_perf2.txt

    rm LLC_l.txt LLC_lm.txt LLC_s.txt LLC_sm.txt dTLB_l.txt dTLB_lm.txt dTLB_s.txt dTLB_sm.txt seconds.txt

  ;;
  4 | multi_res.txt)
    echo "Now formatting multi_res.txt"
    cat multi_res.txt | perl -pe 's{branches}{++$n % 2 ? "BRANCHES" : $&}ge' > multi_ex.txt

    awk '/cycles/ {print $1;}' multi_ex.txt > cycles.txt
    sed -i '1s/^/cycles\n/' cycles.txt

    awk '/instructions/ {print $1;}' multi_ex.txt > instructions.txt
    sed -i '1s/^/instructions\n/' instructions.txt

    awk '/references/ {print $1;}' multi_ex.txt > references.txt
    sed -i '1s/^/cache-references\n/' references.txt

    awk '/cache-misses/ {print $1;}' multi_ex.txt > cache-misses.txt
    sed -i '1s/^/cache-misses\n/' cache-misses.txt

    awk '/BRANCHES/ {print $1;}' multi_ex.txt > branches.txt
    sed -i '1s/^/branches\n/' branches.txt

    awk '/branch-misses/ {print $1;}' multi_ex.txt > branch-misses.txt
    sed -i '1s/^/branch-misses\n/' branch-misses.txt

    awk '/page/ {print $1;}' multi_ex.txt > page-faults.txt
    sed -i '1s/^/page-faults\n/' page-faults.txt

    awk '/System/ {print $10;}' multi_res.txt > multi_power.txt
    sed -i '1s/^/Power\n/' multi_power.txt

    paste cycles.txt instructions.txt references.txt cache-misses.txt branches.txt branch-misses.txt page-faults.txt multi_power.txt | column -s $'\t' -tx > final_data/elastic_multi1.txt

    rm cycles.txt instructions.txt references.txt cache-misses.txt branches.txt branch-misses.txt page-faults.txt multi_power.txt

  ;;
  5 | multic_res.txt)
    echo "Now formatting multic_res.txt"
   
    awk '/LLC-loads/ {print $1;}' multic_res.txt > LLC_l.txt
    sed -i '1s/^/LLC-loads\n/' LLC_l.txt

    awk '/LLC-load-miss/ {print $1;}' multic_res.txt > LLC_lm.txt
    sed -i '1s/^/LLC-load-misses\n/' LLC_lm.txt

    awk '/LLC-stores/ {print $1;}' multic_res.txt > LLC_s.txt
    sed -i '1s/^/LLC-stores\n/' LLC_s.txt

    awk '/LLC-store-miss/ {print $1;}' multic_res.txt > LLC_sm.txt
    sed -i '1s/^/LLC-store-misses\n/' LLC_sm.txt

    awk '/dTLB-loads/ {print $1;}' multic_res.txt > dTLB_l.txt
    sed -i '1s/^/dTLB-loads\n/' dTLB_l.txt

    awk '/dTLB-load-miss/ {print $1;}' multic_res.txt > dTLB_lm.txt
    sed -i '1s/^/dTLB-load-misses\n/' dTLB_lm.txt

    awk '/dTLB-stores/ {print $1;}' multic_res.txt > dTLB_s.txt
    sed -i '1s/^/dTLB-stores\n/' dTLB_s.txt

    awk '/dTLB-store-miss/ {print $1;}' multic_res.txt > dTLB_sm.txt
    sed -i '1s/^/dTLB-store-misses\n/' dTLB_sm.txt

    awk '/System/ {print $10;}' multi_res.txt > multi_power.txt
    sed -i '1s/^/Power\n/' multi_power.txt

    paste LLC_l.txt LLC_lm.txt LLC_s.txt LLC_sm.txt dTLB_l.txt dTLB_lm.txt dTLB_s.txt dTLB_sm.txt multi_power.txt | column -s $'\t' -tx > final_data/elastic_multi2.txt

    rm LLC_l.txt LLC_lm.txt LLC_s.txt LLC_sm.txt dTLB_l.txt dTLB_lm.txt dTLB_s.txt dTLB_sm.txt multi_power.txt

esac


