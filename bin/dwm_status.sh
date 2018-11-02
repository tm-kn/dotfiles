#!/bin/bash
# Mostly borrowed from
# https://github.com/kaihendry/dotfiles/blob/ec64dd44ab6fdbb69471c64bf48f383702e4aaa5/bin/dwm_status

# This function parses /proc/net/dev file searching for a line containing $interface data.
# Within that line, the first and ninth numbers after ':' are respectively the received and transmited bytes.
function get_bytes {
# Find active network interface
interface=$(ip route get 8.8.8.8 2>/dev/null| awk '{print $5}')
line=$(grep $interface /proc/net/dev | cut -d ':' -f 2 | awk '{print "received_bytes="$1, "transmitted_bytes="$9}')
eval $line
now=$(date +%s%N)
}

# Function which calculates the speed using actual and old byte number.
# Speed is shown in KByte per second when greater or equal than 1 KByte per second.
# This function should be called each second.

function get_velocity {
value=$1
old_value=$2
now=$3

timediff=$(($now - $old_time))
velKB=$(echo "1000000000*($value-$old_value)/1024/$timediff" | bc)
if test "$velKB" -gt 1024
then
	echo $(echo "scale=2; $velKB/1024" | bc)MBps
else
	echo ${velKB}KBps
fi
}

# Get initial values
get_bytes
old_received_bytes=$received_bytes
old_transmitted_bytes=$transmitted_bytes
old_time=$now

print_volume() {
	volume="$(pamixer --get-volume)"
    mute="$(pamixer --get-mute)"
	if test "$mute" = true
	then
        echo -e "MUTE ${volume}%"
    else
		echo -e "VOL ${volume}%"
	fi
}

print_mem(){
	memfree=$(($(grep -m1 'MemAvailable:' /proc/meminfo | awk '{print $2}') / 1024))
	echo -e "$memfree""M"
}

print_temp(){
	test -f /sys/class/thermal/thermal_zone0/temp || return 0
	echo $(head -c 2 /sys/class/thermal/thermal_zone0/temp)°C
}

print_bat(){
	hash acpi || return 0
	onl="$(grep "on-line" <(acpi -V))"
	charge="$(awk '{ sum += $1 } END { print sum }' /sys/class/power_supply/BAT*/capacity)"
    low=false
    if [ $charge -lt 10 ]; then
        low=true
    fi
	if test -z "$onl"
	then
        if test $low = true
        then
            echo -e "!! LOW BATTERY !! ${charge}%"
        else
            echo -e "BAT ${charge}%"
        fi
	else
        echo -e "AC ${charge}%"
	fi
}

print_date(){
	date "+%a %d %b %T%:::z"
}

while true
do

	# Get new transmitted, received byte number values and current time
	get_bytes

	# Calculates speeds
	vel_recv=$(get_velocity $received_bytes $old_received_bytes $now)
	vel_trans=$(get_velocity $transmitted_bytes $old_transmitted_bytes $now)

	xsetroot -name "$(print_mem)|$vel_recv|$vel_trans|$(print_temp)|$(print_bat)|$(print_volume)|$(print_date)"

	# Update old values to perform new calculations
	old_received_bytes=$received_bytes
	old_transmitted_bytes=$transmitted_bytes
	old_time=$now

	sleep 1

done
