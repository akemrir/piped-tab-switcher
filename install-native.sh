#!/bin/bash

TARGET=$HOME

while getopts "t:" opt; do
  case $opt in
    t) TARGET=$OPTARG ;;
  esac
done

echo "Instaluję w $TARGET"

# firefox
firefox_target=$TARGET/.mozilla/native-messaging-hosts

mkdir -p $firefox_target
(cat <<EOF
{
  "name": "piped_tab_switcher",
  "description": "Native backend for piped tab switcher.",
  "path": "`pwd`/piped-tabmenu.rb",
  "type": "stdio",
  "allowed_extensions": [ "@piped.tab.switcher" ]
}
EOF
) > $firefox_target/piped_tab_switcher.json
(cat <<EOF
{
  "name": "piped_tab_switcher_bash_debug",
  "description": "Native backend for piped tab switcher with messages debugging",
  "path": "`pwd`/piped-tabmenu-debug.sh",
  "type": "stdio",
  "allowed_extensions": [ "@piped.tab.switcher" ]
}
EOF
) > $firefox_target/piped_tab_switcher_bash_debug.json

# chromium
chromium_target=$TARGET/.config/chromium/NativeMessagingHosts

mkdir -p $chromium_target
(cat <<EOF
{
  "name": "piped_tab_switcher",
  "description": "Native backend for piped tab switcher.",
  "path": "`pwd`/piped-tabmenu.rb",
  "type": "stdio",
  "allowed_extensions": [ "@piped.tab.switcher" ],
  "allowed_origins": [
    "chrome-extension://gdcpljcffechepafecadikhlehjmiafd/"
  ]
}
EOF
) > $chromium_target/piped_tab_switcher.json
(cat <<EOF
{
  "name": "piped_tab_switcher_bash_debug",
  "description": "Native backend for piped tab switcher with messages debugging",
  "path": "`pwd`/piped-tabmenu-debug.sh",
  "type": "stdio",
  "allowed_extensions": [ "@piped.tab.switcher" ],
  "allowed_origins": [
    "chrome-extension://gdcpljcffechepafecadikhlehjmiafd/"
  ]
}
EOF
) > $chromium_target/piped_tab_switcher_bash_debug.json
