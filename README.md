![SourceForge](https://img.shields.io/sourceforge/dm/transkadoosh?label=Download%20Count&style=for-the-badge)
![SourceForge](https://img.shields.io/sourceforge/dt/transkadoosh?label=Total%20Downloads&style=for-the-badge)

# tranSkadooSH

### Transload Shallow Android Sources Into Sourceforge Just like Skadoosh. 
Reborn from [regalstreak's project skadoosh](http://forum.xda-developers.com/android/software/sources-android-sources-highly-t3231109) 😏

## How to add Pull Request:
First, Look for your Desired Sources from the [__My Uploads__](#my-uploads) Section.

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

### My Uploads
💝 _FRESH NEW SOURCES:_ https://sourceforge.net/projects/tranSKadooSH/files/

These Files are Continuously uploading into Server. Keep an eye on this.

👴 _Old Files. You May Download from Here:_ https://androidfilehost.com/?w=files&flid=270268

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

### Subscribe
Join my Telegram Channel for Instant Update of All Old & New Uploaded ROM Sources at [@tranSKadooSH](https://t.me/tranSKadooSH)

---

🚧 This is still _Work in progress_ 🚧

And files are being Uploaded using free account from _CircleCI_.
So, only a few variant of ROMs can be uploaded in a week.
