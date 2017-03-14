#dmesg | tail -2 | grep sd | awk '{print(($4))}'

while getopts d: option
do
        case "${option}"
        in
                d) dev=${OPTARG};;
        esac
done

#echo /dev/$dev




if [[ -z $dev ]]; then
# detect SSD
 for d in /dev/sd? ; do
  disk=$(basename $d)
     if smartctl -a /dev/$disk | grep "Solid State Device"  2>&1 >/dev/null  ; then
      fdisk -l /dev/$disk  | head -1  
      hdparm -N /dev/$disk
      echo " " 
     fi
 done
 echo "set dev"
else
    disk_sectors_max=$(hdparm -N /dev/$dev | grep -o -P '[0-9]+/[0-9]+' | cut -d/ -f2)
    hdparm -Np$disk_sectors_max --yes-i-know-what-i-am-doing /dev/$dev  
fi
