#!/bin/bash


# initServerNode.sh
# Justin Dowd, Clemson Center for Geospatial Technologies, www.clemsongis.org
# March 2018
# This scipt starts a Metashape network server and writes its IP address 
# to address.txt to be used by other scripts
# Contains previous code created by Blake Lytle in December 2017
# ** Edited on March 27, 2019 by Justin Dowd, CCGT Senior GIS Intern **
# ** Edit was to allow scripts to run Metashape instead of PhotoScan, Metashape is the newer version of PhotoScan released by Agisoft **

addr=$(hostname -i)
## Get path to script directory from arguments.txt and write IP address to address.txt ##
dir=`sed -n '6 p' ~/arguments.txt`
echo $addr > $dir/address.txt
chmod u=rwx $dir/address.txt

## Get path to Metashape installation directory and change to it ##
mDir=`sed -n '5 p' ~/arguments.txt`
cd $mDir

# Start Metashape network server
./metashape.sh --server --control $addr --dispatch $addr
