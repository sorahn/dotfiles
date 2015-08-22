### Homesick
sudo gem install homesick
homesick clone git://github.com/sorahn/dotfiles
homesick symlink dotfiles

### Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install fish thefuck node tree unrar wget

###### Neovim
brew tap neovim/neovim
brew install --HEAD neovim

###### Sublime
brew tap caskroom/versions
brew cask insall sublime-text3

###### Casks
brew install caskroom/cask/brew-cask
brew cask install sublime-text3
brew cask install iterm2
brew cask install alfred
brew cask install sonos
brew cask install mou

### NPM
npm install -g bower harp

### SSH
ssh-keygen -t rsa -b 2048

### Tweaks
###### Keyboard
* remap capslock to control
* turn on tab through all controls
* disable "hold for accent menu"
  * `defaults write -g ApplePressAndHoldEnabled -bool false`