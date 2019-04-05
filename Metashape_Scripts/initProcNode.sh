#!/bin/bash
# initProcNode.sh
# Blake Lytle, Clemson Center for Geospatial Technologies, www.clemsongis.org
# December 2017
# Edits made by Justin Dowd, March 2018
# This script will initiate an Agisoft Metashape processing node to run parallelized tasks.
# Make sure the Metashape server node is already running before attempting to run this script.
# ** Edited on March 27, 2019 by Justin Dowd, CCGT Senior GIS Intern **
# ** Edit was to allow scripts to run Metashape instead of PhotoScan, Metashape is the newer version of PhotoScan released by Agisoft **

#Get the 6th line of arguents.txt (Path to arguments.txt)
dir=`sed -n '6 p' ~/arguments.txt`
#Assign the IP Address in address.txt to this variable
addr=`cat $dir/address.txt`

## ENTER YOUR Metashape INSTALLATION DIRECTORY ##
msPath=`sed -n '5 p' ~/arguments.txt`

# Start Metashape processing node. GPU's are enabled, output to screen is disabled, and absolute paths are used.
cd $msPath
./metashape.sh --node --dispatch $addr --gpu_mask 1 --absolute_paths 1 --root /scratch2 -platform offscreen
