#!/bin/bash
# firefox
firefox_target=$HOME/.mozilla/native-messaging-hosts

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
chromium_target=$HOME/.config/chromium/NativeMessagingHosts

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
