#!/bin/bash

# Authors - Neil "regalstreak" Agarwal, Harsh "MSF Jarvis" Shandilya, Tarang "DigiGoon" Kagathara
# 2016, 2017
# This file is used to run skadoo.sh easily.
# --------------------------------------------------------------------
# Now modified to compress only Shallow sources and upload to Mega
# --------------------------------------------------------------------
# By Rokib Hasan Sagar
# ------------------------

### Manifest Configuration ###
# Name of the ROM. No Spaces Please.
# Example: CyanogenMod, SlimRoms, AOSP, TWRP
name=ResurrectionRemix

# Manifest link. https:// is mandatory.
# Example: https://github.com/cyanogenmod/android
manifest=https://github.com/ResurrectionRemix/platform_manifest.git

# Manifest branch.
# Example: cm-14.0, nougat, Lineage-15.1
branch=nougat

### User Autentication ###
# Specify here your GitHub Info
GitHubMail=johndoe@email.domain
GitHubName=johncena

### Your FTP Server / AFH Account Details ###
# Specify your server address/ip, username & password
FTPHost=uploads.androidfilehost.com
FTPUser=johndoe
FTPPass=s3cr3tw0rdz

### Finally, execute the stuff. ###
# Do Not Touch The Following Line
/bin/bash ./magic.sh $name $manifest $branch $GitHubMail $GitHubName $FTPHost $FTPUser $FTPPass
