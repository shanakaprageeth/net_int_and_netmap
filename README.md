# network interace monitor and netmap driver insertion
## Description
This include two scripts 
1. monitor network interface stats on a linux system
2. Insert netmap driver into the system

## Prerequisites
Netmap

## Installing
Please edit int_stats.sh and load-ixgbe-netmap.sh with your network interface details before execution.
execute the following command to monitor network interface stats:
```
./int_stats.sh
```
execute the following command to insert netmap driver to ixgbe network interface:
```
./load-ixgde-netmap.sh
```


## Acknowledgement 
[Netmap](https://github.com/luigirizzo/netmap)

## License
[MIT](https://choosealicense.com/licenses/mit/)
