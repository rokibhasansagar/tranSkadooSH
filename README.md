# tranSkadooSH
### Transload Shallow Android Sources Just like Skadoosh.
Reborn from regalstreak's project skadoosh

All information on base project available on the [XDA thread](http://forum.xda-developers.com/android/software/sources-android-sources-highly-t3231109)

**Warning:** Do not upload your own username & password along with this repo if you modify the project!

## Usage:
IMPORTANT: Edit "compress.bash" and Replace some elements

1. Go to line #15, After 'name=', Enter Name of the ROM. (No Spaces Please.) Example: CyanogenMod, SlimRoms, ResurrectionRemix or DND, etc.
2. Go to line #19, After 'manifest=', Enter GitHub Manifest link. Example: https://github.com/cyanogenmod/android.git
3. Go to line #23, After 'branch=', Enter the Branch name. Example: cm-14.1, Lineage-15.1, or nougat, etc. from the Repo.
4. Go to line #27 & #28, After 'GitHubMail=' & 'GitHubName=', Enter your GitHub user-email & username without any spaces.
5. Go to line #32 & #33, After 'MegaUserMail=' & 'MegaPass=', Enter your Mega.NZ accont user-email & _password_ without any spaces.

### Now run `./compress.bash` from within the directory