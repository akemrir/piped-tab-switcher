#!/bin/bash

mkdir -p $HOME/.mozilla/native-messaging-hosts/
(cat <<EOF
{
  "name": "ruby_interface",
  "description": "Native backend for dmenu tab switcher.",
  "path": "`pwd`/rubyface.rb",
  "type": "stdio",
  "allowed_extensions": [ "@rofi.tab.switcher" ]
}
EOF
) > $HOME/.mozilla/native-messaging-hosts/ruby_interface.json
