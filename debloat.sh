#!/bin/bash

# The script needs to run as root, so stop if we aren't.
if [[ "$EUID" -ne 0 ]]; then
  echo "Error: script must be run with root privileges."
  exit 1
fi

# Function to make sure the user has explicitly chosen y or n, otherwise stop.
function validateChoice {
  if [[ ($1 != "y") && ($1 != "n") ]]; then
    echo "Error: invalid choice."
    exit 1
  fi
}

# Display banner.
echo "#####################################################"
echo "#                                                   #"
echo "#             Cinnamon Debloater Script             #"
echo "#  https://github.com/rainier39/Cinnamon-Debloater  #"
echo "#                                                   #"
echo "#####################################################"

# Whether or not to remove all of the packages without prompting for each one.
echo -n "Yes to all? (highly recommended to at least look through script beforehand) [y/n]: "
read -r all

validateChoice "$all"

# -- Remove all of the pre-installed games. --
if [[ $all != "y" ]]; then
  echo -n "Remove games? [y/n]: "
  read -r games
  validateChoice "$games"
fi

if [[ ($all == "y") || ($games == "y") ]]; then
  sudo apt-get purge gnome-2048 aisleriot gnome-chess five-or-more four-in-a-row hitori gnome-klotski lightsoff gnome-mahjongg gnome-mines gnome-nibbles quadrapassel iagno gnome-robots gnome-sudoku swell-foop tali gnome-taquin gnome-tetravex -y
fi

# -- Remove the web chatting programs. --
if [[ $all != "y" ]]; then
  echo -n "Remove web chatting programs? [y/n]: "
  read -r chatting
  validateChoice "$chatting"
fi

if [[ ($all == "y") || ($chatting == "y") ]]; then
  sudo apt-get purge hexchat pidgin -y
fi

# -- Remove the remote desktop program. --
if [[ $all != "y" ]]; then
  echo -n "Remove remote desktop program? [y/n]: "
  read -r rd
  validateChoice "$rd"
fi

if [[ ($all == "y") || ($rd == "y") ]]; then
  sudo apt-get purge remmina -y
fi

# -- Remove Thunderbird (email client). --
if [[ $all != "y" ]]; then
  echo -n "Remove Thunderbird? (it's an email client) [y/n]: "
  read -r thb
  validateChoice "$thb"
fi

if [[ ($all == "y") || ($thb == "y") ]]; then
  sudo apt-get purge thunderbird -y
fi

# -- Remove the torrent client. --
if [[ $all != "y" ]]; then
  echo -n "Remove Transmission? (torrent client) [y/n]: "
  read -r tm
  validateChoice "$tm"
fi

if [[ ($all == "y") || ($tm == "y") ]]; then
  sudo apt-get purge transmission-gtk -y
fi

# -- Remove LibreOffice. --
if [[ $all != "y" ]]; then
  echo -n "Remove LibreOffice suite? [y/n]: "
  read -r lo
  validateChoice "$lo"
fi

if [[ ($all == "y") || ($lo == "y") ]]; then
  sudo apt-get purge libreoffice-common -y
fi

# -- Remove document programs. --
if [[ $all != "y" ]]; then
  echo -n "Remove document viewer and document scanner? [y/n]: "
  read -r doc
  validateChoice "$doc"
fi

if [[ ($all == "y") || ($doc == "y") ]]; then
  sudo apt-get purge simple-scan evince -y
fi

# -- Remove Shotwell. --
if [[ $all != "y" ]]; then
  echo -n "Remove Shotwell? (image organizer) [y/n]: "
  read -r shw
  validateChoice "$shw"
fi

if [[ ($all == "y") || ($shw == "y") ]]; then
  sudo apt-get purge shotwell -y
fi

# -- Remove camera/microphone related programs. --
if [[ $all != "y" ]]; then
  echo -n "Remove camera/microphone related programs? [y/n]: "
  read -r cam
  validateChoice "$cam"
fi

if [[ ($all == "y") || ($cam == "y") ]]; then
  sudo apt-get purge cheese gnome-sound-recorder -y
fi

# -- Remove CD related programs. --
if [[ $all != "y" ]]; then
  echo -n "Remove CD related programs? [y/n]: "
  read -r cd
  validateChoice "$cd"
fi

if [[ ($all == "y") || ($cd == "y") ]]; then
  sudo apt-get purge brasero sound-juicer -y
fi

# Normally I remove the pre-installed media players and install VLC.
# -- Remove Rhythmbox. --
if [[ $all != "y" ]]; then
  echo -n "Remove Rhythmbox? (audio player/organizer) [y/n]: "
  read -r rb
  validateChoice "$rb"
fi

if [[ ($all == "y") || ($rb == "y") ]]; then
  sudo apt-get purge rhythmbox -y
fi

# -- Remove Videos. --
if [[ $all != "y" ]]; then
  echo -n "Remove Videos? (media player) [y/n]: "
  read -r vids
  validateChoice "$vids"
fi

if [[ ($all == "y") || ($vids == "y") ]]; then
  sudo apt-get purge totem -y
fi

# -- Remove GDebi, Synaptic, and Software. --
if [[ $all != "y" ]]; then
  echo -n "Remove GDebi, Synaptic, and Gnome Software? (GUI package managers) [y/n]: "
  read -r gdebi
  validateChoice "$gdebi"
fi

if [[ ($all == "y") || ($gdebi == "y") ]]; then
  sudo apt-get purge gdebi gnome-software synaptic -y
fi

# -- Remove Parental Controls. --
if [[ $all != "y" ]]; then
  echo -n "Remove Parental Controls? [y/n]: "
  read -r pctrls
  validateChoice "$pctrls"
fi

if [[ ($all == "y") || ($pctrls == "y") ]]; then
  sudo apt-get purge malcontent -y
fi

# -- Remove Log Viewer. --
if [[ $all != "y" ]]; then
  echo -n "Remove Log Viewer? [y/n]: "
  read -r logs
  validateChoice "$logs"
fi

if [[ ($all == "y") || ($logs == "y") ]]; then
  sudo apt-get purge gnome-logs -y
fi

# -- Remove Gnome Help. --
if [[ $all != "y" ]]; then
  echo -n "Remove Gnome Help? [y/n]: "
  read -r help
  validateChoice "$help"
fi

if [[ ($all == "y") || ($help == "y") ]]; then
  sudo apt-get purge yelp -y
fi

# -- Remove Gnote Help. --
if [[ $all != "y" ]]; then
  echo -n "Remove Gnote? [y/n]: "
  read -r gnote
  validateChoice "$gnote"
fi

if [[ ($all == "y") || ($gnote == "y") ]]; then
  sudo apt-get purge gnote -y
fi

# -- Autopurge to remove dependencies/now unnecessary packages. --
if [[ $all != "y" ]]; then
  echo -n "Autopurge? (removes dependencies/now unnecessary packages) [y/n]: "
  read -r auto
  validateChoice "$auto"
fi

if [[ ($all == "y") || ($auto == "y") ]]; then
  sudo apt-get autopurge -y
fi

echo "Done debloating!"
