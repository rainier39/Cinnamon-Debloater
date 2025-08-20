# Cinnamon-Debloater
This shell script removes any packages that I have deemed "bloat" which are installed by default in a fresh install of the Cinnamon desktop environment on Debian. I created it mostly for my own personal use but have decided to publish it for anyone to use. I would strongly recommend reading through the script before running it; in fact one should always do that before running a script like this to make sure it isn't malware or that it doesn't do undesirable things in general. The script itself is relatively user friendly, and will prompt the user for each removal with a brief message about what exactly it's removing. That is, unless you enter "y" to the first prompt which I wouldn't recommend unless you truly want to remove everything that the script removes.

## Installation/Usage Instructions
Download the script.

> git clone https://github.com/rainier39/Cinnamon-Debloater

Enter the script's directory.

> cd Cinnamon-Debloater

Make the script executable.

> chmod 700 debloat.sh

Run the script as the superuser.

> sudo ./debloat.sh

The prompts within the script will guide you the rest of the way.

## Version Information
Developed and tested on Debian 12 in an Oracle VirtualBox Virtual Machine. Tested on Debian 13 in an Oracle VirtualBox VM.
