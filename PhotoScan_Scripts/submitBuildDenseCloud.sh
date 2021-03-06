#PBS -N BuildDenseCloud
#PBS -l select=1:ncpus=16:mem=64gb,walltime=05:00:00
#PBS -W block=true

# submitBuildDenseCloud.sh
# Justin Dowd, Clemson Center for Geospatial Technologies, www.clemsongis.org
# March 2018
# This Script reads in the Path to the users PhotoScan Installation Dorectory and the Path to where 
# the user stored their processing scripts. Using that information PhotoScan is started offscreen and runs
# a python script that will use the parallel processing nodes to build the dense cloud for the users project
# and use certain designated paths in arguments.txt to save the project under the correct name and in the requested directory

#Get the 5th line of arguments.txt (Path to PhotoScan installation directory) and assign it to this variable
photoscan=`sed -n '5 p' arguments.txt`
#Get the 6th line of arguments.txt (Path to directory containing processing scripts) and assign it to this variable
ad=`sed -n '6 p' arguments.txt`
#Assign the default home directory assigned by PBS to a variable; The directory should be "/home/USERNAME"
#This is where arguments.txt needs to be located for all the scripts to access its contents
cwd=$HOME

#Starts PhotoScan offscreen and runs the Python Script BuildDenseCloud.py and passes arguments.txt as an argument to the script
sh $photoscan/photoscan.sh -platform offscreen -r $ad/BuildDenseCloud.py $cwd/arguments.txt

