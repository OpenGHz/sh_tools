#!/usr/bin/env bash

set -e

echo "物理CPU个数:"
cat /proc/cpuinfo| grep "physical id"| sort| uniq| wc -l

echo "每个物理CPU中core的个数(即核数):"
cat /proc/cpuinfo| grep "cpu cores"| uniq

echo "逻辑CPU的个数:"
cat /proc/cpuinfo| grep "processor"| wc -l

echo "总线程数(可以理解为逻辑CPU的数量):"
grep 'processor' /proc/cpuinfo | sort -u | wc -l

echo "注："
echo " 1. 总核数 = 物理CPU个数 X 每颗物理CPU的核数"
echo " 2. 总逻辑CPU数 = 物理CPU个数 X 每颗物理CPU的核数 X 超线程数"