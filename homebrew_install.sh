#!/bin/bash

echo "installing homebrew..."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update..."
which brew >/dev/null 2>&1 && brew update

echo "ok. run brew upgrade..."

brew upgrade --all

formulas=(
    go
    hugo
    git
    gibo
    wget
    curl
    tree
    openssl
    cask
    autojump
    peco
    hub
    tig
    markdown
    fish
    rbenv
    mas
    ffmpeg
    graphviz
    plantuml
)

echo "start brew install apps..."
for formula in "${formulas[@]}"; do
    brew install $formula || brew upgrade $formula
done

casks=(
    dropbox
    bettertouchtool
    google-chrome
    google-japanese-ime
    slack
    iterm2
    atom
    docker
    visual-studio-code
    kindle
    deckset
    duet
    charles

)

echo "start brew cask install apps..."
for cask in "${casks[@]}"; do
    brew cask install $cask
done

brew cleanup

mas install 424389933 # finalcut
mas install 434290957 # motion
mas install 866773894 # quiver
mas install 1278508951 # trello
mas install 1289197285 # mindnode
mas install 

cat << END

**************************************************
HOMEBREW INSTALLED! bye.
**************************************************

END

