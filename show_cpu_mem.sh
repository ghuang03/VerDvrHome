#!/bin/sh
sar -u 2 1  | awk 'NR==4{printf "Total CPU usage: %s (%.2f%%)\n",$3+$4+$5+$6+$7,$3+$4+$5+$6+$7 }' 
free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'
df -h | awk '$NF=="/"{printf "Disk Usage for / : %d/%d MB (%s)\n", $3,$2,$5}'
df -h | awk '$NF=="/hd/data"{printf "Disk Usage for /ha/data: %s/%s (%s)\n", $3,$2,$5}'
#busybox top -bn1 | grep load | awk '{printf "CPU Load: %.2f\n", $(NF-2)}'
#sar -u 2 3  -bn1 | grep load | awk '{printf "CPU Load: %.2f\n", $(NF-2)}'
#sar -u 2 1  | awk 'NR==4{printf "Total CPU usage: %s (%.2f%%)\n",$3+$4+$5+$6+$7,$3+$4+$5+$6+$7 }' 
 
