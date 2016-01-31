#!/bin/bash
#
# Hungarian keyboard layouts make heavy use of the AltGr key (when typing special characters) that is
# normally located on the right side of the space key on standard PC keyboards. On Mac keyboards the
# key that is located on the right side of the keyboard is the RightCommand and the AltGR
# (RightAlt/RightOption) is on the right side of RightCommand where it is very uncomfortable to
# reach with the right thumb.
# For convenience this script turns your RightCommand key into another RightAlt (RightOption) key.
# The LeftCommand and RightAlt keys are left unaffected.
# Before using this script you may have to modify it by adjusting the VENDOR_ID and PRODUCT_ID
# variables below. After executing the script you have to log off/on.
#
# This solution is based on the following stackoverflow answer:
# http://apple.stackexchange.com/a/88096

# You have to find out the vendor and product ids of your keyboard using the
# ioreg command as specified in the linked stackoverflow answer:
# ioreg -n IOHIDKeyboard -r | grep -e 'class IOHIDKeyboard' -e VendorID\" -e Product
VENDOR_ID=1452
PRODUCT_ID=628

# If you have more than one keyboards...
KEYBOARD_NUMBER=0

# Turning the RightCommand into a RightAlt (RightOption) key:
defaults -currentHost write -g com.apple.keyboard.modifiermapping.$VENDOR_ID-$PRODUCT_ID-$KEYBOARD_NUMBER -array-add '
<dict>
	<key>HIDKeyboardModifierMappingDst</key><integer>11</integer>
	<key>HIDKeyboardModifierMappingSrc</key><integer>12</integer>
</dict>
'

# You can undo the changes by executing the following command and then logging off/on:
# defaults -currentHost delete -g com.apple.keyboard.modifiermapping.$VENDOR_ID-$PRODUCT_ID-$KEYBOARD_NUMBER
#
# You can use this command to check the current settings:
# defaults -currentHost read -g
