# piped-tab-switcher

Addon shortcut ctrl+comma.

Only Linux is supported.

# Requirements:

* `dmenu` in $PATH
* `ruby 2.7`

To install, clone into an appropriate, non-temporary folder and run `install-native.sh` to
set up the manifest for the native backend.

install-native accepts -t and -p flag to indicate other directory to install native scripts, for example archlive skel directory
install-native.sh -t ~/build/archlive/airootfs/etc/skel -p /home/deploy

# dev tests
Firefox addon dev installation
- about:debugging
- sidebar this firefox
- temporarily install addon
- choose this directory
