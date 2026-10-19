#!/bin/bash
#operates in /home/$USER/code/latex/
#Removes contents of .tmp folder and .gz/.pdf files, as well as moving tex files to old/

cdir="/home/$USER/code/latex"
rm $cdir/*.gz $cdir/*.pdf $cdir/.tmp/*
mv --backup=numbered $cdir/*.tex $cdir/old/
