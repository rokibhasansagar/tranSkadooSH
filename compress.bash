#!/bin/bash

# Original Authors of "skadoosh" ---
# Neil "regalstreak" Agarwal,
# Harsh "MSF Jarvis" Shandilya,
# Tarang "DigiGoon" Kagathara
# Copyright © 2017
# -----------------------------------------------------
# Modified by - Rokib Hasan Sagar @rokibhasansagar
# =====================================================

### Manifest Configuration ###

# Name of the ROM, without any Spaces.
# Example: CyanogenMod, SlimRoms, AOSP, TWRP
name=""

# Manifest link. https:// is mandatory.
# Example: https://github.com/cyanogenmod/android
manifest=""

# Manifest branch.
# Example: cm-14.0, nougat, Lineage-15.1
branch=""

### Finally, execute the stuff. ###
# Do Not Touch The Following Line

check_envs() {
  [[ -z $name ]] && echo -e '\033[31m'"ROM Short Name is Empty, \nCan't Work. Exiting..."'\033[0m' && exit 1
  [[ -z $manifest ]] && echo -e '\033[31m'"ROM Manifest URL is Empty, \nCan't Work. Exiting..."'\033[0m' && exit 1
  [[ -z $branch ]] && echo -e '\033[31m'"Android Branch Name is Empty, \nCan't Work. Exiting..."'\033[0m' && exit 1
}

check_envs
/bin/bash ./magic.sh $name $manifest $branch
