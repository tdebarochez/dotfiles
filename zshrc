# zgen
source "${HOME}/.zsh/zgen/zgen.zsh"
if ! zgen saved; then
  echo "Creating a zgen save"

  zgen oh-my-zsh plugins/sudo
  zgen oh-my-zsh plugins/httpie
  zgen oh-my-zsh plugins/command-not-found
  zgen load zsh-users/zsh-syntax-highlighting
  zgen oh-my-zsh plugins/history-substring-search
  zgen load zsh-users/zsh-completions src
  zgen load olivierverdier/zsh-git-prompt
  zgen load chrissicool/zsh-256color
  zgen load johnhamelink/rvm-zsh
  zgen load johnhamelink/env-zsh
  zgen load tomsquest/nvm-init.zsh

  zgen save
fi

source ~/.zsh/config.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/bindkey.zsh
source ~/.zsh/prompt.zsh

for f in ~/.zsh/functions/*; do
  source $f
done

if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi
