#!/bin/sh

# Use ZSH as the default shell
chsh -s $(which zsh)

test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
test -r ~/.zshrc && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >>~/.zshrc
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >>~/.profile

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /workspaces/.codespaces/.persistedshare/dotfiles/zsh-syntax-highlighting
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

brew install romkatv/powerlevel10k/powerlevel10k
echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc

source ~/.zshrc

