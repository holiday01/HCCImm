#!/bin/bash

while getopts ":i:p:n:o:h:s:" arg;do 
	case "${arg}" in
		i)preinput=${OPTARG};;
		p)preplat=${OPTARG};;
		n)prenor=${OPTARG};;
		o)preout=${OPTARG};;
		h)dinput=${OPTARG};;
		s)dout=${OPTARG};;
	esac
done

Rscript ./Script/Main.R -i $preinput -p $preplat  -n $prenor -o $preout
~/opt/anaconda3/bin/python3 ./Script/HCCImm.py $dinput $dout



