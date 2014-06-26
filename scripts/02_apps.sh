# homebrew apps
brew install atool cpulimit duff exiftool git git-extras git-ftp hr id3v2 lftp mackup mediainfo mkvtoolnix mp4box namebench phantomjs trash tree watchman z
brew install imagemagick --with-libtiff
brew install ffmpeg --with-libvpx --with-libvorbis --with-theora
brew install macvim --with-lua --custom-icons
brew install sox --with-flac --with-lame --with-libvorbis
brew install vim --with-lua
brew install zsh --disable-etcdir

# install mpv
brew tap mpv-player/mpv
brew install --HEAD mpv-player/mpv/libass-ct
brew install mpv --with-bundle

# install massren
brew tap laurent22/massren
brew install massren

# homebrew-cask apps
# install brew cask
brew tap caskroom/cask
brew install brew-cask

# set caskroom permissions
mkdir -p /opt/homebrew-cask/Caskroom
sudo chown -R ${USER}:staff /opt/homebrew-cask

# install apps
brew cask install --appdir="/Applications" airserver alfred apikitchen bartender bettertouchtool cocoadialog dropbox enjoyable flux fontprep google-chrome hex-fiend imageoptim instacast iterm2 joinme keka key-codes leap-motion macaw macdown node-webkit openemu phoenix platypus pokerstars processing screenflow shiori shotcut spectacle steam sublime-text textexpander transmission

# drivers
brew cask install xbox360-controller-driver wacom-bamboo-tablet

# prefpanes and qlplugins
brew cask install betterzipql jsonlook qlcolorcode qlimagesize qlmarkdown qlstephen scriptql secrets suspicious-package vox-preference-pane

# fonts
brew tap caskroom/homebrew-fonts
brew cask install font-source-code-pro

# games
#brew cask install gridwars noiz2sa rootage torustrooper

# colorpickers
brew cask install colorpicker-antetype colorpicker-skalacolor

# my personal taps
# tiny-scripts
brew tap vitorgalvao/homebrew-tinyscripts
brew install cask-repair casks-audit crafts customise-terminal-notifier dropboxtimer gfv gifmaker labelcolor lovecolor olx-post pedir-gas pinboardlinkcheck podbook seren unsplashdownload

# cleanup homebrew's cache
brew cleanup --force -s
rm -rf $(brew --cache)
