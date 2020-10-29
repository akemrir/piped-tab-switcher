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
