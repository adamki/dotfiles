#!/bin/bash
 . ./utils/colors.sh

echo -e "${HR}"
echo -e "${bold}Deleting Old backups...${normal}"
rm -rf $HOME/$backupdir

echo -e "${HR}"
echo -e "${bold}Making new Directories...${normal}"
for directory in $directories; do
  echo -e "$Making ${directory}"
  mkdir -p $directory
done
echo -e "\n"

cd $dotfilesdir

echo -e "${HR}"
echo -e "${bold}Backing up existing files...${normal}"
for file in $files; do
    if [[ ! -f $HOME/$file ]]; then
      touch $HOME/$file
    fi

    mv -v $HOME/$file $backupdir/$file
    mvvalue=$?
    if [[ $mvvalue -ne 0 ]]; then
      echo -e "${red}Warning:${reset} Was NOT able to backup: ${file}${reset}"
    fi
done
echo -e "\n"

echo -e "${HR}"
echo -e "${bold}Symlinking files...${normal}"
for file in $files; do
    ln -siv $dotfilesdir/$file $HOME/$file
    lnvalue=$?
    if [[ $lnvalue -ne 0 ]]; then
      echo -e "${red}Warning:${reset} Was NOT able to symlink: ${red}${file}${reset}"
    fi
done

echo -e "\n"
echo -e "${HR}"
echo -e "${green}Symlinking Complete!\nOld config files have been backed up to $backupdir${reset}"
