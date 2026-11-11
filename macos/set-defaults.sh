# Sets reasonable macOS defaults.
#

# Show the ~/Library folder.
chflags nohidden ~/Library

# Run the screensaver if we're in the bottom-left hot corner.
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0

defaults write com.apple.dock 'orientation' -string 'left'

# Set up Safari for development.
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Make VSCode Vim Mode sane
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false

# Map casplock to escape
 hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x700000029}]}'

# Window tiling shortcuts for Rectangle on Ctrl+Cmd, so they work on keyboards
# without a globe/fn key. Rectangle reads these at launch, so restart it after
# running this script.
CTRL_CMD=1310720      # control (262144) + command (1048576)
CTRL_OPT_CMD=1835008  # control + option (524288) + command
rectangle_shortcut() {
  defaults write com.knollsoft.Rectangle "$1" -dict keyCode -int "$2" modifierFlags -int "$3"
}

# Halves: Ctrl+Cmd+Arrow
rectangle_shortcut leftHalf   123 $CTRL_CMD
rectangle_shortcut rightHalf  124 $CTRL_CMD
rectangle_shortcut topHalf    126 $CTRL_CMD
rectangle_shortcut bottomHalf 125 $CTRL_CMD

# Quarters: Ctrl+Cmd+U/I/J/K
rectangle_shortcut topLeft     32 $CTRL_CMD
rectangle_shortcut topRight    34 $CTRL_CMD
rectangle_shortcut bottomLeft  38 $CTRL_CMD
rectangle_shortcut bottomRight 40 $CTRL_CMD

# Maximize: Ctrl+Cmd+Return, Center: Ctrl+Cmd+C, Restore: Ctrl+Cmd+Backspace
rectangle_shortcut maximize 36 $CTRL_CMD
rectangle_shortcut center    8 $CTRL_CMD
rectangle_shortcut restore  51 $CTRL_CMD

# Move between displays: Ctrl+Opt+Cmd+Left/Right
rectangle_shortcut previousDisplay 123 $CTRL_OPT_CMD
rectangle_shortcut nextDisplay     124 $CTRL_OPT_CMD

# Repeating a left/right half shortcut pushes the window to the next display.
defaults write com.knollsoft.Rectangle subsequentExecutionMode -int 1
