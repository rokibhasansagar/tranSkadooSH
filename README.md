# tranSkadooSH
### Transload Shallow Android Sources Into FTP/AFH Just like Skadoosh.
Reborn from regalstreak's project skadoosh 😏
http://forum.xda-developers.com/android/software/sources-android-sources-highly-t3231109

**Warning:** 🚨 Do not upload your own username & password along with this repo if you modify the project!

## Usage:
If you want me to add more sources and upload them for you, make sure you do the followings:

- [x] Edit "compress.bash" and Replace some elements.
- [x] Go to line #15. After 'name=', Enter Name of the ROM. (No Spaces Please.) Example: CyanogenMod, SlimRoms, ResurrectionRemix or DND, etc.
- [x] Go to line #19. After 'manifest=', Enter GitHub Manifest link. Example: https://github.com/cyanogenmod/android.git
- [x] Go to line #23. After 'branch=', Enter the Branch name. Example: cm-14.1, Lineage-15.1, or nougat, etc. from the Repo.

Then create a pull request and submit.
That's all. 💖

---

😎 **_If you are doing this project yourself on your own computer or a server, you have to edit some more lines._**

- [x] Go to line #27 & #28. After 'GitHubMail=' & 'GitHubName=', Enter your GitHub user-email & username without any spaces.
- [x] Go to line #32, #33 & #34. After 'FTPHost=', 'FTPUser=' & 'FTPPass=', Enter your FTP server account information without any spaces.
- [x] Run `chmod +x compress.bash magic.sh` after editing the file.
- [x] Now run `./compress.bash` from within the directory

---

### My uploaded repos
Download from Here: https://androidfilehost.com/?w=files&flid=270268

_Work in progress_
