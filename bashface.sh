#!/bin/bash

# cat /dev/stdin >> bashface.log
#
# echo 'oddaję'

dunstify bashface 'odpalam'

tee messages.dump | ./rubyface.rb 2>> rubyface.out
