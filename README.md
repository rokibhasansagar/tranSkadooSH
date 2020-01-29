[![SourceForge](https://img.shields.io/sourceforge/dt/transkadoosh?label=All%20Time%20Downloads&style=for-the-badge&cacheSeconds=600)](#)

[![SourceForge](https://img.shields.io/sourceforge/dm/transkadoosh?cacheSeconds=600)](#)
[![SourceForge](https://img.shields.io/sourceforge/dw/transkadoosh?cacheSeconds=600)](#)

# tranSkadooSH

### Transload Shallow Android Sources Into Sourceforge Just like Skadoosh. 
Reborn from [regalstreak's project skadoosh](http://forum.xda-developers.com/android/software/sources-android-sources-highly-t3231109) 😏

## How to add Pull Request:
First, Look for your Desired Sources from the [__Project Download Site__](#-project-download-site) Section.

If you want me to add more sources and upload them for you, make sure you do the followings:

- [x] Fork this Repository,  
- [x] Edit "compress.bash" and Replace only 3 elements.
- [x] Go to line #16. After 'name=', Enter Name of the ROM. (No Spaces Please.) 
  - Example: CyanogenMod, SlimRoms, ResurrectionRemix or DND, etc.
- [x] Go to line #20. After 'manifest=', Enter GitHub Manifest link. 
  - Example: https://github.com/cyanogenmod/android.git
- [x] Go to line #24. After 'branch=', Enter the Branch name. 
  - Example: cm-14.1, Lineage-15.1, or nougat, etc. from the Repo.

Then create a pull request and submit.
That's all. 💖

---

## 💝 _Project Download Site_

<a href="https://tinyurl.com/tranSKadooSH/"><img alt="Download tranSKadooSH" src="https://sourceforge.net/sflogo.php?type=17&group_id=3178722" width=200></a>

These Files are Continuously uploading into Server. Keep an eye on this.

---

### _Individual Projects_
Now, Only Marshmallow, Nougat & Oreo Branchs are Available for Download

ROM Name   | Download Link for Individual ROM  | Download Counts
:---------:|:---------------------------------:|:--------------------------:
AICP       | https://tinyurl.com/wewagpd       | [![SourceForge](https://img.shields.io/sourceforge/dt/tranSKadooSH/AICP?cacheSeconds=600)](#)
AOKP       | https://tinyurl.com/urtrc2f       | [![SourceForge](https://img.shields.io/sourceforge/dt/tranSKadooSH/AOKP?cacheSeconds=600)](#)
AOSP       | https://tinyurl.com/rbrtwtj       | [![SourceForge](https://img.shields.io/sourceforge/dt/tranSKadooSH/AOSP?cacheSeconds=600)](#)
CarbonROM  | https://tinyurl.com/sfkxes5       | [![SourceForge](https://img.shields.io/sourceforge/dt/tranSKadooSH/CarbonROM?cacheSeconds=600)](#)
CesiumOS   | https://tinyurl.com/wdsunwg       | [![SourceForge](https://img.shields.io/sourceforge/dt/tranSKadooSH/CesiumOS?cacheSeconds=600)](#)
DotOS      | https://tinyurl.com/ss5nxec       | [![SourceForge](https://img.shields.io/sourceforge/dt/tranSKadooSH/DotOS?cacheSeconds=600)](#)
LineageOS  | https://tinyurl.com/taq329v       | [![SourceForge](https://img.shields.io/sourceforge/dt/tranSKadooSH/LineageOS?cacheSeconds=600)](#)
ResurrectionRemix  | https://tinyurl.com/swbkqm3    | [![SourceForge](https://img.shields.io/sourceforge/dt/tranSKadooSH/ResurrectionRemix?cacheSeconds=600)](#)
SlimRoms   | https://tinyurl.com/wbauqdk       | [![SourceForge](https://img.shields.io/sourceforge/dt/tranSKadooSH/SlimRoms?cacheSeconds=600)](#)


### 👴 _Old Files:_
_https://androidfilehost.com/?w=files&flid=270268_

---

## How To Use These Compressed Files

1. First you will have to join the archive parts into one big archive. Download all the parts. Then put all parts in one folder.
2. Verify the integrity md5sum of parts by 
```bash
 md5sum -c *.md5sum
```
3. Join them by 
```bash
 cat *.tar.xz.* > yourbigarchivename.tar.xz
```
4. Now `cd` to the folder where you have joined the downloaded parts. Extract it using 
```bash
 tar xvJf yourbigarchivename.tar.xz -C "/path/inside/your/project/dir/"
```
5. To use these sources, you will have to extract them as mentioned above. 
You should get a `.repo` folder. In the same folder itself (not inside _.repo_ but the folder that contains .repo), 
you will have to update the local work tree. You can update it by using
```bash
 repo sync -c -q --force-sync --no-clone-bundle --no-tags -j16
```
6. The above command will help you to use minimum data/internet as it does not download extra tags or clone bundles.
If you do not want to use data at all, you can use below command, which will not fetch anything from the internet.
```bash
 repo sync -c -q --force-sync --no-clone-bundle --optimized-fetch --prune --no-tags -j16 --local-only
```

Happy Coding! 🤗

## Subscribe
Join my Telegram Channel for Instant Update of All Old & New Uploaded ROM Sources at [@tranSKadooSH](https://t.me/tranSKadooSH)

---

### 🚧 This is still _Work in progress_ 🚧

And files are being Uploaded using free account from _CircleCI_.
So, only a few variant of ROMs can be uploaded in a week.
