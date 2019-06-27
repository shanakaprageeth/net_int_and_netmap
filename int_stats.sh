INTERVAL="1"  # update interval in seconds
 
if [ -z "$1" ]; then
        echo
        echo usage: $0 [network-interface]
        echo
        echo e.g. $0 eth0
        echo
        echo shows packets-per-second
        exit
fi
 
IF=$1
echo "eth0"
echo "TX pkts/s, RX pkts/s,TX kB/s, RX kB/s, TX drops pkts/s, RX drops pkts/s"

while true
do
        R1_packets=`cat /sys/class/net/$1/statistics/rx_packets`
        T1_packets=`cat /sys/class/net/$1/statistics/tx_packets`
	R1_bytes=`cat /sys/class/net/$1/statistics/rx_bytes`
        T1_bytes=`cat /sys/class/net/$1/statistics/tx_bytes`
        R1_dropped=`cat /sys/class/net/$1/statistics/rx_dropped`
        T1_dropped=`cat /sys/class/net/$1/statistics/tx_dropped`
        sleep $INTERVAL
        R2_packets=`cat /sys/class/net/$1/statistics/rx_packets`
        T2_packets=`cat /sys/class/net/$1/statistics/tx_packets`
        R2_bytes=`cat /sys/class/net/$1/statistics/rx_bytes`
        T2_bytes=`cat /sys/class/net/$1/statistics/tx_bytes`
	R2_dropped=`cat /sys/class/net/$1/statistics/rx_dropped`
        T2_dropped=`cat /sys/class/net/$1/statistics/tx_dropped`
        TXPPS=`expr $T2_packets - $T1_packets`
        RXPPS=`expr $R2_packets - $R1_packets`
	TBPS=`expr $T2_bytes - $T1_bytes`
        RBPS=`expr $R2_bytes - $R1_bytes`
        TKBPS=`expr $TBPS / 1024`
        RKBPS=`expr $RBPS / 1024`
	TXDRPS=`expr $T2_dropped - $T1_dropped`
        RXDRPS=`expr $R2_dropped - $R1_dropped`	
        #echo "TX $1: $TXPPS pkts/s RX $1: $RXPPS pkts/s"
	#echo "TX $1: $TKBPS kB/s RX $1: $RKBPS kB/s"
	#echo "TX drops $1: $TXDRPS pkts/s RX drops $1: $RXDRPS pkts/s"
	echo "$TXPPS, $RXPPS,$TKBPS, $RKBPS, $TXDRPS, $RXDRPS"
	
done

