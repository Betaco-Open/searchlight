![searchlight_logo](https://user-images.githubusercontent.com/64083352/188547718-d7a3e9b6-a68c-473b-ac5f-b34badd99574.svg)


Searchlight helps you synchronize files across devices and add search capability throughout your entire ecosystem. 


## Why searchlight
Ever wondered how you would get a file scanned through your mobile device in the critical instance of last minute submissions?
How you would send your very large file(approx. 10 GB) over to your workstation without having low transfer speed of Bluetooth<sup>TM</sup> protocol?
or Opening and viewing your favourite movie or series app while working on your pc?
searchlight is the solution
## How to install
<details>
<summary>Windows</summary>
<br>
  
- Step 1: Download the installation [zip](https://github.com/Betaco-Open/searchlight/releases/download/v0.1.0/release.zip) 
- Step 2: Extract the zip at any location of your choice
- To activate auto-launch continue else skip to Step 7
- Step 3: Right click `searchlight_gui.exe` the show more options(only on Windows 11)
- Step 4: Press Create Shortcut
- Step 5: Open File Explorer or Press Win+E and go to `%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup`
- Step 6: Then copy the shortcut file from unzipped folder named `searchlight_gui.exe - shortcut` to `%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup`
- Step 7: Double Click on `searchlight_gui.exe` in unzipped folder (Press Allow if Microsoft Defender Screen Appears)
- Step 8: Now press `Alt+Z` and start Searchlight App
 <br>
</details>

<details>
<summary>Ubuntu</summary>
<br>
  
- Step 1: Download the binary tarball for linux [zip](https://github.com/Betaco-Open/searchlight/releases/download/v0.1.0/release.zip) 
- Step 2: Extract the zip at any location of your choice
- Step 3: Open Settings > Keyboard > Custom Shortcut
- Step 4: Press Create Shortcut
- Step 5: In command type '$EXTRACTED_ZIP_LOCATION\searchlight_gui'  
- Step 6: Then configure your Shortcut e.g.Alt+Q for opening Searchlight and Save Settings.
- Step 7: Now press `Alt+Q`/<your shortcut> and start Searchlight App
- Step 8: To exit press `Alt+Z`
  
</details>

## What is current developent status?
Currently, searchlight is at alpha - 0.1 state. But is being developed with love and precision. We hope to reach at a stable release soon. <br>
Searchlight Public Alpha Release v0.1.1 is Out <br>
Try it: <br>
- Windows(x64) : [Download Here](https://github.com/Betaco-Open/searchlight/releases/download/v0.1.1/searchlight_gui-windows-x64.tar.xz)  <br>
- Linux(x64) : [Download Here](https://github.com/Betaco-Open/searchlight/releases/download/v0.1.1/searchlight_gui-linux-x64.tar.xz) <br>


Send your queries to :
<br>

[//]: <> (searchlight@betaco.tech <br>)

support@betaco.tech

## How can you contribute?
If you are a developer familiar with Python and Dart/Flutter development or Swift, Java and C#/.Net. You can contribute via code. Any improvements or features added via testing or developing are highly appreciated.
If you face any issue / have a suggestion please raise request at [Issues](https://github.com/Betaco-Open/searchlight/issues) tab

[//]: <> (Also, funding this project also will help it thrive longer.)

Features:
- Synchronize Files across devices(Android,Linux,Windows,MacOS and FreeBSD)
- Inbuilt Clipboard Manager
- Use Any Android App from Linux,Windows,MacOS
- Commands, Keywords and Keyboard Shortcuts

  <br>
  
Additional Features include:
- Support for Alfred and Raycast Plugins
- SDK for App Developers
- Extensions Support in Python, Rust and JS

## Roadmap and Update (Sep '24)
Code in this repo was not updated for last 5 months and is built over flutter version 3.0.5
I didnt have a mac to test and build, due to which the development was hampered severly. During the period I also realsed that a solution was necessary and there are many other problems with existing file solutions that need to be addressed.
Hence, this project will be the first part of complete integration suite for various ecosystem of devices.
From now on most probably weekly dev builds with features would be supported.


