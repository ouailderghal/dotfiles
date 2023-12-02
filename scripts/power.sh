#!/bin/bash

if grep -q powersave /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor;
then
    echo "performance" | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
else
    echo "powersave" | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
fi
