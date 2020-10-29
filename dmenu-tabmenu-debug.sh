#!/bin/bash

# cat /dev/stdin >> bashface.log
#
# echo 'oddaję'

dunstify bashface 'odpalam'

tee tabmenu-messages.dump | ./dmenu-tabmenu.rb 2>> dmenu-tabmenu.out
