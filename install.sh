#!/bin/bash

mkdir -p $HOME/.mozilla/native-messaging-hosts/
(cat <<EOF
{
  "name": "dmenu_tabmenu_interface",
  "description": "Native backend for dmenu tab switcher.",
  "path": "`pwd`/dmenu-tabmenu.rb",
  "type": "stdio",
  "allowed_extensions": [ "@rofi.tab.switcher" ]
}
EOF
) > $HOME/.mozilla/native-messaging-hosts/dmenu_tabmenu_interface.json

mkdir -p $HOME/.mozilla/native-messaging-hosts/
(cat <<EOF
{
  "name": "bash_debug_interface",
  "description": "Native backend for dmenu tab switcher debug.",
  "path": "`pwd`/dmenu-tabmenu-debug.sh",
  "type": "stdio",
  "allowed_extensions": [ "@rofi.tab.switcher" ]
}
EOF
) > $HOME/.mozilla/native-messaging-hosts/bash_debug_interface.json
