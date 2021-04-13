<p align="center">
    <img src="https://i.imgur.com/pysYvXG_d.webp?maxwidth=760&fidelity=grand" width="100" />
</p>
<h1 align="center">Treecord</h1>
<p align="center">A modded Discord client for <b>Android</b>!</p>
<p align="center">
    <a href="https://discord.gg/uKRZJqVt5n" target="_blank">
        <img src="https://img.shields.io/discord/829183921446322246.svg?style=for-the-badge&label=&logo=discord&logoColor=ffffff&color=7389D8&labelColor=6A7EC2" />
    </a>
</p>

## How to build

#### Notes
- If you're using NixOS you can run `nix-shell` to start a shell with the required packages
- If you want to use ADB, ensure that you have enabled USB debugging and that your computer is trusted

##### Prequisites

- Java 8+
- ADB (If you want to automatically sideload to your device)
- *unix (Or some way to patch files)
- Default Discord v67.12 APK \*[cough cough](https://apkpure.com/discord-talk-video-chat-hang-out-with-friends/com.discord/)\*

##### Steps

1) Decompile Discord
```sh
java -jar ./lib/apktool.jar d /path/to/discord.apk -o ./src/
```
2) Apply Treecord patch
```sh
patch -s -p0 < ./treecord.patch
```
2.1) (Optional) Apply a theme patch from `./themes/`
```sh
patch -s -p0 < ./themes/<theme-name>/theme.patch
```
3) Build the APK
```sh
java -jar ./lib/apktool.jar b ./src
```
4) Create a new keystore with the following command. You can use any dummy information, just remember the password for later.
```sh
keytool -genkey -keystore <file>.keystore -validity 10000 -alias <alias>
```
5) Sign the APK
```sh
jarsigner -storepass <password> -keystore <file>.keystore <alias>
```
6) If you don't want to sideload it with ADB the APK is located in `./src/dist/treecord.apk`
7) Sideload with ADB
```sh
adb install -r ./src/dist/treecord.apk
```
8) Launch with ADB 
```sh
adb shell monkey -p me.l3af.treecord 1
```

