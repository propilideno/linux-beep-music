#!/bin/bash

# Verify if modprofe is loaded for pcspkr
if [[ "$(lsmod | grep pcspkr)" ]]; then
	MODULE_LOADED=1
else
	echo "Loading pcspkr module..."
	sudo modprobe pcspkr #Unload the module to allow beep
	sleep 0.5
fi

play() {
    local note=$1
    shift
    local duration interval frequency OPTIND

    while getopts ":d:i:" opt; do
        case $opt in
            d) duration="$OPTARG" ;;
            i) interval="$OPTARG" ;;
            \?) echo "Invalid option: -$OPTARG" >&2; return 1 ;;
            :) echo "Option -$OPTARG requires an argument." >&2; return 1 ;;
        esac
    done
    shift $((OPTIND -1))

    case $note in
        "C0") frequency=16.35 ;;
        "C#0") frequency=17.32 ;;
        "Db0") frequency=17.32 ;;
        "D0") frequency=18.35 ;;
        "D#0") frequency=19.45 ;;
        "Eb0") frequency=19.45 ;;
        "E0") frequency=20.60 ;;
        "F0") frequency=21.83 ;;
        "F#0") frequency=23.12 ;;
        "Gb0") frequency=23.12 ;;
        "G0") frequency=24.50 ;;
        "G#0") frequency=25.96 ;;
        "Ab0") frequency=25.96 ;;
        "A0") frequency=27.50 ;;
        "A#0") frequency=29.14 ;;
        "Bb0") frequency=29.14 ;;
        "B0") frequency=30.87 ;;
        "C1") frequency=32.70 ;;
        "C#1") frequency=34.65 ;;
        "Db1") frequency=34.65 ;;
        "D1") frequency=36.71 ;;
        "D#1") frequency=38.89 ;;
        "Eb1") frequency=38.89 ;;
        "E1") frequency=41.20 ;;
        "F1") frequency=43.65 ;;
        "F#1") frequency=46.25 ;;
        "Gb1") frequency=46.25 ;;
        "G1") frequency=49.00 ;;
        "G#1") frequency=51.91 ;;
        "Ab1") frequency=51.91 ;;
        "A1") frequency=55.00 ;;
        "A#1") frequency=58.27 ;;
        "Bb1") frequency=58.27 ;;
        "B1") frequency=61.74 ;;
        "C2") frequency=65.41 ;;
        "C#2") frequency=69.30 ;;
        "Db2") frequency=69.30 ;;
        "D2") frequency=73.42 ;;
        "D#2") frequency=77.78 ;;
        "Eb2") frequency=77.78 ;;
        "E2") frequency=82.41 ;;
        "F2") frequency=87.31 ;;
        "F#2") frequency=92.50 ;;
        "Gb2") frequency=92.50 ;;
        "G2") frequency=98.00 ;;
        "G#2") frequency=103.83 ;;
        "Ab2") frequency=103.83 ;;
        "A2") frequency=110.00 ;;
        "A#2") frequency=116.54 ;;
        "Bb2") frequency=116.54 ;;
        "B2") frequency=123.47 ;;
        "C3") frequency=130.81 ;;
        "C#3") frequency=138.59 ;;
        "Db3") frequency=138.59 ;;
        "D3") frequency=146.83 ;;
        "D#3") frequency=155.56 ;;
        "Eb3") frequency=155.56 ;;
        "E3") frequency=164.81 ;;
        "F3") frequency=174.61 ;;
        "F#3") frequency=185.00 ;;
        "Gb3") frequency=185.00 ;;
        "G3") frequency=196.00 ;;
        "G#3") frequency=207.65 ;;
        "Ab3") frequency=207.65 ;;
        "A3") frequency=220.00 ;;
        "A#3") frequency=233.08 ;;
        "Bb3") frequency=233.08 ;;
        "B3") frequency=246.94 ;;
        "C4") frequency=261.63 ;;
        "C#4") frequency=277.18 ;;
        "Db4") frequency=277.18 ;;
        "D4") frequency=293.66 ;;
        "D#4") frequency=311.13 ;;
        "Eb4") frequency=311.13 ;;
        "E4") frequency=329.63 ;;
        "F4") frequency=349.23 ;;
        "F#4") frequency=369.99 ;;
        "Gb4") frequency=369.99 ;;
        "G4") frequency=392.00 ;;
        "G#4") frequency=415.30 ;;
        "Ab4") frequency=415.30 ;;
        "A4") frequency=440.00 ;;
        "A#4") frequency=466.16 ;;
        "Bb4") frequency=466.16 ;;
        "B4") frequency=493.88 ;;
        "C5") frequency=523.25 ;;
        "C#5") frequency=554.37 ;;
        "Db5") frequency=554.37 ;;
        "D5") frequency=587.33 ;;
        "D#5") frequency=622.25 ;;
        "Eb5") frequency=622.25 ;;
        "E5") frequency=659.25 ;;
        "F5") frequency=698.46 ;;
        "F#5") frequency=739.99 ;;
        "Gb5") frequency=739.99 ;;
        "G5") frequency=783.99 ;;
        "G#5") frequency=830.61 ;;
        "Ab5") frequency=830.61 ;;
        "A5") frequency=880.00 ;;
        "A#5") frequency=932.33 ;;
        "Bb5") frequency=932.33 ;;
        "B5") frequency=987.77 ;;
        "C6") frequency=1046.50 ;;
        "C#6") frequency=1108.73 ;;
        "Db6") frequency=1108.73 ;;
        "D6") frequency=1174.66 ;;
        "D#6") frequency=1244.51 ;;
        "Eb6") frequency=1244.51 ;;
        "E6") frequency=1318.51 ;;
        "F6") frequency=1396.91 ;;
        "F#6") frequency=1479.98 ;;
        "Gb6") frequency=1479.98 ;;
        "G6") frequency=1567.98 ;;
        "G#6") frequency=1661.22 ;;
        "Ab6") frequency=1661.22 ;;
        "A6") frequency=1760.00 ;;
        "A#6") frequency=1864.66 ;;
        "Bb6") frequency=1864.66 ;;
        "B6") frequency=1975.53 ;;
        "C7") frequency=2093.00 ;;
        "C#7") frequency=2217.46 ;;
        "Db7") frequency=2217.46 ;;
        "D7") frequency=2349.32 ;;
        "D#7") frequency=2489.02 ;;
        "Eb7") frequency=2489.02 ;;
        "E7") frequency=2637.02 ;;
        "F7") frequency=2793.83 ;;
        "F#7") frequency=2959.96 ;;
        "Gb7") frequency=2959.96 ;;
        "G7") frequency=3135.96 ;;
        "G#7") frequency=3322.44 ;;
        "Ab7") frequency=3322.44 ;;
        "A7") frequency=3520.00 ;;
        "A#7") frequency=3729.31 ;;
        "Bb7") frequency=3729.31 ;;
        "B7") frequency=3951.07 ;;
        "C8") frequency=4186.01 ;;
        "C#7") frequency=4434.92 ;;
        "Db7") frequency=4434.92 ;;
        "D7") frequency=4698.63 ;;
        "D#7") frequency=4978.03 ;;
        "Eb7") frequency=4978.03 ;;
        "E7") frequency=5274.04 ;;
        "F7") frequency=5587.65 ;;
        "F#7") frequency=5919.91  ;;
        "Gb7") frequency=5919.91  ;;
        "G7") frequency=6271.93 ;;
        "G#7") frequency=6644.88 ;;
        "Ab7") frequency=6644.88 ;;
        "A7") frequency=7040.00 ;;
        "A#7") frequency=7458.62 ;;
        "Bb7") frequency=7458.62 ;;
        "B7") frequency=7902.13 ;;
        *) echo "Invalid note $note" >&2; return 1 ;;
    esac

	# echo "Frequency: $frequency"
	# echo "Duration: $duration"
	# echo "Interval: $interval"
	
    # Play the note with specified duration and interval
    beep -f $frequency -l $duration
    sleep $interval
}

# Usage: play_song_with_interval song intervals
#
# # Play song
# index=0
# for note in $song; do
# 	# echo $note
# 	index=$(( index%10 ))
# 	# echo ${intervals[$index]}
# 	play $note -d 70 -i ${intervals[$index]}
# 	printf "$note "
# 	index=$(( index+1 ))
# done
#

play_song_with_interval(){
	local song=$1
	shift
	local intervals=("$@")
	local index=0
	for note in $song; do
		# echo $note
		index=$(( index%10 ))
		# echo ${intervals[$index]}
		play $note -d 70 -i ${intervals[$index]}
		printf "$note "
		index=$(( index+1 ))
	done
	echo ""
}

[[ $MODULE_LOADED ]] || { echo "Unloading pcspkr module"; sudo modprobe -r pcspkr; } #Unload the module to allow beep
