#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask admin pass before and keep it alive until script is done
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

brew update

brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

brew install vim --override-system-vi
brew install git
brew install tmux
brew install tree
brew install tig
brew install fzf
brew install ripgrep
brew install the_silver_searcher
brew install nvm
mkdir ~/.nvm
brew install yarn c$without-node

# Applications
brew cask install google-chrome
brew cask install firefox
brew cask install slack
brew cask install dash
brew cask install alfred
brew cask install spotify
brew cask install robo-3t
brew cask install insomnia
brew cask install Java
brew install Caskroom/cask/iterm2
brew install Caskroom/cask/dropbox

#dev tools
brew install redis
brew install direnv
brew install mongodb


# Remove outdated versions from the cellar.
brew cleanup
