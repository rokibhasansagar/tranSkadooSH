#!/bin/bash

# Original Authors of "skadoosh" ---
# Neil "regalstreak" Agarwal,
# Harsh "MSF Jarvis" Shandilya,
# Tarang "DigiGoon" Kagathara
# Copyright © 2017
# -----------------------------------------------------
# Modified by - Rokib Hasan Sagar @rokibhasansagar
# =====================================================

### Definitions need to be parsed from compress.bash file ---

name= "$1"
manifest= "$2"
branch= "$3"

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

# Prepare
DIR=$(pwd)
echo -en "\n" $CL_XOS "Current directory is - " && echo -e $DIR $CL_RST "\n"

mkdir -p {tranSKadooSH,transload}
mkdir -p $name/$branch

cd tranSKadooSH

datetime=$(date +%Y%m%d)

google_cookies() {
  echo -en "\n" $CL_INS "Setup Google Cookies for Smooth googlesource Cloning" $CL_RST
  git clone -q "https://$GITHUB_TOKEN@github.com/rokibhasansagar/google-git-cookies.git" &> /dev/null
  if [ -e google-git-cookies ]; then
    bash google-git-cookies/setup_cookies.sh
    rm -rf google-git-cookies
  fi
}

git_auth() {
  echo -e "\n" $CL_INS "Github Authorization Setting Up" $CL_RST
  git config --global user.email $GitHubMail
  git config --global user.name $GitHubName
  git config --global color.ui true

  google_cookies
}

trim_darwin() {
  echo -e "\n" $CL_PFX "Removing Unimportant Darwin-specific Files from syncing" $CL_RST
  cd .repo/manifests
  sed -i '/darwin/d' default.xml
  git commit -a -m "Magic" || true
  cd ../
  sed -i '/darwin/d' manifest.xml
  cd ../
}

repo_sync_shallow() {
  echo -e "\n\n" $CL_GRN "Initialize repo Command" $CL_RST
  repo init -q -u $manifest -b $branch --depth 1

  trim_darwin

  CPU_COUNT=$(grep -c ^processor /proc/cpuinfo)
  THREAD_COUNT_SYNC=$(($CPU_COUNT * 8))

  echo -e "\n" $CL_YLW "Syncing it up! Wait for a few minutes..." $CL_RST
  repo sync -c -q --force-sync --no-clone-bundle --optimized-fetch --prune --no-tags -j$THREAD_COUNT_SYNC

  echo -e "\n" $CL_MAG "SHALLOW Source Syncing done" $CL_RST

  echo -e "\n" $CL_BLU "All Checked-out Folder/Files are Here -" $CL_RST
  ls -la .
}

move_repo() {
  cd $DIR
  mv tranSKadooSH/.repo transload/
}

clean_checkout() {
  cd $DIR
  echo -e "\n" $CL_CYN "Cleaning Checked-out Files" $CL_RST
  rm -rf tranSKadooSH
}

compress_shallow() {
  cd $DIR/transload/
  echo -e "\n"  $CL_BLU"Source Compressing in parts, This will take some time" $CL_RST
  tar -cJf - .repo | split -b 1280M - ../$name/$branch/$name-$branch-repo-$datetime.tar.xz.

  cd $DIR/$name/$branch/
  echo -e "\n" $CL_PFX "Taking md5sums" $CL_RST
  md5sum * > $name-$branch-repo-$datetime.tar.xz.md5sum
  echo -e "\n" $CL_GRN "The Compressed Files are -" $CL_RST
  du -sh *
}

release_payload() {
  cd $DIR/
  echo -e "\n" $CL_XOS "Begin to upload into SourceForge Release" $CL_RST

  echo "exit" | sshpass -p "$SFPass" ssh -tto StrictHostKeyChecking=no $SFUser@shell.sourceforge.net create
  rsync -arvPz --rsh="sshpass -p $SFPass ssh -l $SFUser" $name/ $SFUser@shell.sourceforge.net:/home/frs/project/$SFProject/$name/  

  echo -e "\n" $CL_GRN "Done uploading" $CL_RST
  echo -e "\n" $CL_BLU "Go to 'https://sourceforge.net/projects/transkadoosh/files/$name/' for the Files" $CL_RST
}

clean_all() {
  cd $DIR
  rm -rf transload $name
}

tranSKadooSH() {
  git_auth
  repo_sync_shallow
  if [ $? -eq 0 ]; then
    move_repo
    clean_checkout
    compress_shallow
    if [ $? -eq 0 ]; then
      release_payload
    fi
  fi
}

tranSKadooSH
if [ $? -eq 0 ]; then
  clean_all
else
  echo -e $CL_RED "Something Wrong" $CL_RST && exit 1
fi

echo -e "\n\n" $CL_BLU "All Process Done" $CL_RST "\n\n"