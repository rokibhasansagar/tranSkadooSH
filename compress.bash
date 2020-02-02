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

# Name of the ROM, (The Git Org Name) without any Spaces.
# Example: CyanogenMod, SlimRoms, AOSP, ResurrectionRemix, TWRP
name="XenonHD"

# Manifest link. https:// is mandatory.
# Example: https://github.com/cyanogenmod/android.git
manifest="https://github.com/TeamHorizon/platform_manifest.git"

# Manifest branch.
# Example: cm-14.0, nougat, Lineage-15.1
branch="o"

### Finally, execute the stuff. ###
# Do Not Touch The Following Line

check_envs() {
  [[ -z $name ]] && ( echo -e '\033[31m'"ERROR! ROM Short Name is Empty."'\033[0m' && exit 1 )
  [[ -z $manifest ]] && ( echo -e '\033[31m'"ERROR! ROM Manifest URL is Empty."'\033[0m' && exit 1 )
  [[ -z $branch ]] && ( echo -e '\033[31m'"ERROR! Android Branch Name is Empty."'\033[0m' && exit 1 )
}

check_envs
/bin/bash ./magic.sh $name $manifest $branch
