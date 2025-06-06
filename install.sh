#! /bin/bash
log_file=~/install_progress_log.txt
program_list=("cava" "dunst" "hypr"
  "kitty" "matugen" "ncspot" "nushell" "neovim"
  "qt6ct" "starship" "waybar" "starship" "waybar"
  "wlogout" "xsettings" "zsh")
for program in ${program_list[@]}; do
  sudo pacman -S $program
  if type -p $program >/dev/null; then
    echo "$program installed" >>$log_file
  else
    echo "$program FAILED TO INSTALL!!" >>$log_file

  fi

done
