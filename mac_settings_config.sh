#!/bin/bash

# Based on https://github.com/diaglamp/MacEfficientTools/blob/7804ec8b32a7421f93f2e5dfe595f87601da6592/install-steps/macos.sh

# Enable clickpad Tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
[ -e ~/Library/Application\ Support/Dock/*.db ] && rm ~/Library/Application\ Support/Dock/*.db


# Show battery percentage
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Enable three finger to drag
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true

# Disable text auto correct
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# Apply configurations without rebooting
for app in Finder Dock Mail SystemUIServer; do killall "$app" >/dev/null 2>&1; done
