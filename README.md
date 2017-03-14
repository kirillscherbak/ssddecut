# ssddecut


This script find ssd and decut it.

If run without params it show ssd dev and they use/max sectors

Parameters:

-d - define device

Examples:

1) sudo ./ssd.sh 
 [sudo] пароль для master: 
 Диск /dev/sda: 111,8 GiB, 120034123776 байтов, 234441648 секторов
 
 /dev/sda:
  max sectors   = 234441648/234441648, HPA is disabled
 
 set dev

select disk in output
and next run whith -d patametr

2) sudo ./ssd.sh -d sda

