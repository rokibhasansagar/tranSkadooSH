#!/bin/bash

# Authors - Neil "regalstreak" Agarwal, Harsh "MSF Jarvis" Shandilya, Tarang "DigiGoon" Kagathara
# 2017
# -----------------------------------------------------
# Modified by - Rokib Hasan Sagar @rokibhasansagar
# -----------------------------------------------------

# Get SHELL Environment
sudo -s

# Definitions
DIR=$(pwd)
ROMNAME=$1
LINK=$2
BRANCH=$3

GITMAIL=$4
GITNAME=$5

MEGAUSER=$6
MEGAPASS=$7

# Colors
CL_XOS="\033[34;1m"
CL_PFX="\033[33m"
CL_INS="\033[36m"
CL_RED="\033[31m"
CL_GRN="\033[32m"
CL_YLW="\033[33m"
CL_BLU="\033[34m"
CL_MAG="\033[35m"
CL_CYN="\033[36m"
CL_RST="\033[0m"

# Necessary Application Installation
apt-get update -y && apt-get install git repo pxz megatools -y
 
# Github Authorization
git config --global user.email $GITMAIL
git config --global user.name $GITNAME

# Main Function
doSync(){
    cd $DIR; mkdir -p $ROMNAME/shallow; cd $ROMNAME/shallow

    repo init -u $LINK -b $BRANCH --depth 1

    # Sync it up!
    time repo sync -c -f -q --force-sync --no-clone-bundle --no-tags -j32

    echo -e $CL_RED" SHALLOW Source  .. - ..  Syncing done "$CL_RST
    echo -e $CL_RED" Moving and compressing .repo "$CL_RST

    cd $DIR/$ROMNAME/
	
    mkdir $ROMNAME-$BRANCH-repo-$(date +%Y%m%d)

    mv shallow/.repo/ $ROMNAME-$BRANCH-repo-$(date +%Y%m%d)

	# Delete $ROMNAME/shallow directory
    rm -rf shallow
	
    # Compress .repo folder
	mkdir repoparts
    export XZ_OPT=-9
    time tar -I pxz -cvf - $ROMNAME-$BRANCH-repo-$(date +%Y%m%d)/ | split -b 700M - repoparts/$ROMNAME-$BRANCH-repo-$(date +%Y%m%d).tar.xz.
    SHALLOW="repoparts/$ROMNAME-$BRANCH-repo-$(date +%Y%m%d).tar.xz.*"

    echo -e $CL_RED" SHALLOW Source  .. - ..  Compression Done "$CL_RST

    echo -e $CL_RED" SHALLOW Source Sorting "$CL_RST

    sortSyncedParts
    megaUpload

    cd $DIR/$ROMNAME

    echo -e $CL_RED"SHALLOW | Cleaning"$CL_RST

    rm -rf upload
	
    rm -rf $SHALLOWMD5
    rm -rf shallowparts
    rm -rf $ROMNAME-$BRANCH-shallow-$(date +%Y%m%d)

}


sortSyncedParts(){

    echo -e $CL_RED" SHALLOW Source  .. - ..  Begin to sort "$CL_RST

    cd $DIR/$ROMNAME
    rm -rf upload
    mkdir -p upload/$ROMNAME/$BRANCH/repo

    mv $SHALLOW upload/$ROMNAME/$BRANCH/repo

    echo -e $CL_PFX" Done sorting "$CL_RST

    # Md5s
    echo -e $CL_PFX" Taking md5sums "$CL_RST

    cd $DIR/$ROMNAME/upload/$ROMNAME/$BRANCH/repo
    md5sum * > $ROMNAME-$BRANCH-repo-$(date +%Y%m%d).parts.md5sum

}

megaUpload(){

    echo -e $CL_XOS" Begin to upload "$CL_RST

    cd $DIR/$ROMNAME/upload
    
    # Make Directories in MEGA
    megamkdir /Root/$ROMNAME --username=$MEGAUSER --password=$MEGAPASS
    megamkdir /Root/$ROMNAME/$BRANCH --username=$MEGAUSER --password=$MEGAPASS
    
    # Upload
    SHALLOWUP="$ROMNAME/$BRANCH/repo/$ROMNAME-$BRANCH-repo-$(date +%Y%m%d).*"
    megaput $SHALLOWUP --path=/Root/$ROMNAME/$BRANCH --username=$MEGAUSER --password=$MEGAPASS

    echo -e $CL_XOS" Done uploading "$CL_RST

}

# Do All The Stuff
doallstuff(){

    # Compress shallow source
    doSync

}


# So at last do everything
doallstuff
if [ $? -eq 0 ]; then
    echo "Everything done!"
    rm -rf $DIR/$ROMNAME
fi
