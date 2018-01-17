#!/bin/bash
#
# Hungarian keyboard layouts make heavy use of the AltGr key (when typing special characters) that is
# normally located on the right side of the space key on standard PC keyboards. On Mac keyboards the
# key that is located on the right side of the keyboard is the RightCommand and the AltGR
# (RightAlt/RightOption) is on the right side of RightCommand where it is very uncomfortable to
# reach with the right thumb.
# For convenience this script turns your RightCommand key into another RightAlt (RightOption) key.
# The LeftCommand and RightAlt keys are left unaffected.

# Info about the whole thing (including the list of key codes)
# https://developer.apple.com/library/content/technotes/tn2450/_index.html

# An easy way to find out the ID of a keyboard is going to the
# System Preferences > Keyboard > Modifier Keys ...
# changing a few modifier keys for the given keyboard and then checking
# the saved settings with the `defaults -currentHost read -g` command.

RIGHT_ALT_TO_RIGHT_CMD='
<dict>
	<key>HIDKeyboardModifierMappingDst</key><integer>30064771302</integer>
	<key>HIDKeyboardModifierMappingSrc</key><integer>30064771303</integer>
</dict>
'

RIGHT_CMD_TO_RIGHT_ALT='
<dict>
	<key>HIDKeyboardModifierMappingDst</key><integer>30064771303</integer>
	<key>HIDKeyboardModifierMappingSrc</key><integer>30064771302</integer>
</dict>
'

# Turning the RightCommand into a RightAlt (RightOption) key:
defaults -currentHost delete -g com.apple.keyboard.modifiermapping.1452-628-0
defaults -currentHost write -g com.apple.keyboard.modifiermapping.1452-628-0 -array-add "$RIGHT_ALT_TO_RIGHT_CMD"
defaults -currentHost write -g com.apple.keyboard.modifiermapping.1452-628-0 -array-add "$RIGHT_CMD_TO_RIGHT_ALT"

# Wireless magic keyboard:
defaults -currentHost delete -g com.apple.keyboard.modifiermapping.alt_handler_id-50
defaults -currentHost write -g com.apple.keyboard.modifiermapping.alt_handler_id-50 -array-add "$RIGHT_ALT_TO_RIGHT_CMD"
defaults -currentHost write -g com.apple.keyboard.modifiermapping.alt_handler_id-50 -array-add "$RIGHT_CMD_TO_RIGHT_ALT"


LEFT_ALT_TO_CTRL='
<dict>
	<key>HIDKeyboardModifierMappingDst</key><integer>30064771296</integer>
	<key>HIDKeyboardModifierMappingSrc</key><integer>30064771298</integer>
</dict>
'

# In StarCraft we need this for group zero.
BACKTICK_TO_ZERO='
<dict>
	<key>HIDKeyboardModifierMappingDst</key><integer>30064771125</integer>
	<key>HIDKeyboardModifierMappingSrc</key><integer>30064771111</integer>
</dict>
'

ZERO_TO_BACKTICK='
<dict>
	<key>HIDKeyboardModifierMappingDst</key><integer>30064771111</integer>
	<key>HIDKeyboardModifierMappingSrc</key><integer>30064771125</integer>
</dict>
'

defaults -currentHost delete -g com.apple.keyboard.modifiermapping.1133-49938-0
defaults -currentHost write -g com.apple.keyboard.modifiermapping.1133-49938-0 -array-add "$LEFT_ALT_TO_CTRL"
defaults -currentHost write -g com.apple.keyboard.modifiermapping.1133-49938-0 -array-add "$BACKTICK_TO_ZERO"
defaults -currentHost write -g com.apple.keyboard.modifiermapping.1133-49938-0 -array-add "$ZERO_TO_BACKTICK"

defaults -currentHost read -g
