#PBS -N MatchPhotos
#PBS -l select=1:ncpus=16:mem=50gb,walltime=05:00:00
#PBS -W block=true

# submitMatchPhotos.sh
# Justin Dowd, Clemson Center for Geospatial Technologies, www.clemsongis.org
# March 2018
# This Script reads in the Path to the users Metashape Installation Directory and the Path to where 
# the user stored their processing scripts. Using that information Metashape is started offscreen and runs
# a python script that is the first step of processing and creates the first instance of the project and then uses the parallel processing 
# nodes to match all the photos in the users project
# and use certain designated paths in arguments.txt to save the project under the correct name and in the requested directory
# ** Edited on March 27, 2019 by Justin Dowd, CCGT Senior GIS Intern **
# ** Edit was to allow scripts to run Metashape instead of PhotoScan, Metashape is the newer version of PhotoScan released by Agisoft **

#Get the 5th line of arguments.txt (Path to Metashape installation directory) and assign it to this variable
metashape=`sed -n '5 p' arguments.txt`
#Get the 6th line of arguments.txt (Path to directory containing processing scripts) and assign it to this variable
ad=`sed -n '6 p' arguments.txt`
#Assign the default home directory assigned by PBS to a variable; The directory should be "/home/USERNAME"
#This is where arguments.txt needs to be located for all the scripts to access its contents
cwd=$HOME

#Starts Metashape offscreen and runs the Python Script MatchPhotos.py and passes arguments.txt as an argument to the script
sh $metashape/metashape.sh -platform offscreen -r $ad/MatchPhotos.py $cwd/arguments.txt

