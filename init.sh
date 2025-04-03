#!/bin/bash

set -e

echo "🔧 Installing Homebrew if not installed..."
which brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "🍺 Installing packages from Brewfile..."
brew bundle --file=~/dotfiles/Brewfile

echo "🌀 Installing Oh My Zsh if not installed..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "→ Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo "✓ Oh My Zsh already installed."
fi

echo "🔗 Linking dotfiles..."
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

echo "📁 Setting up config files..."
mkdir -p ~/.config/some_app
ln -sf ~/dotfiles/config/some_app/config_file ~/.config/some_app/config_file

echo "✅ Done! Restart your terminal 😄"
