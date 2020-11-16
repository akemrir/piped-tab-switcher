#!/bin/bash

# cat /dev/stdin >> bashface.log
#
# echo 'oddaję'

dunstify bashface 'odpalam'

tee piped-tabmenu-messages.dump | ./piped-tabmenu.rb 2>> piped-tabmenu.out
