# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zgen
source ~/.zgen/zgen.zsh
# update it frequently running `zgen update`
if ! zgen saved; then
  echo "Creating a zgen save"

  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-syntax-highlighting
  zgen oh-my-zsh plugins/history-substring-search # MUST be after zsh-syntax-highlighting
  zgen oh-my-zsh plugins/gpg-agent
  zgen oh-my-zsh plugins/sudo
  zgen oh-my-zsh plugins/httpie
  zgen oh-my-zsh plugins/command-not-found
  zgen load zsh-users/zsh-completions src
  zgen load chrissicool/zsh-256color
  zgen load johnhamelink/env-zsh
  zgen load theunraveler/zsh-fancy_ctrl_z
  zgen load BurntSushi/ripgrep complete
  zgen load docker/compose contrib/completion/zsh
  zgen load tomsquest/q.plugin.zsh
  zgen load romkatv/powerlevel10k powerlevel10k

  # Remove Zsh completion cache, given we may have updated a completion
  rm ~/.zcompdump || true

  zgen save
fi

source ~/.zsh/config.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/bindkey.zsh
source ~/.zsh/virtuo.zsh
#source ~/.zsh/prompt.zsh

HOMEBREW_HOME=/opt/homebrew

# Load rupa Z: quickly jump to recent directory with the z command
# Example: z foo
# See: https://github.com/rupa/z
source ~/.rupa-z/z.sh

# cargo (rust)
[[ ! -f $HOME/.cargo/env ]] || source $HOME/.cargo/env

# asdf
[[ ! -f $HOMEBREW_HOME/opt/asdf/libexec/asdf.sh ]] || source $HOMEBREW_HOME/opt/asdf/libexec/asdf.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$HOMEBREW_HOME/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_HOME/opt/nvm/nvm.sh"  # This loads nvm
[ -s "$HOMEBREW_HOME/opt/nvm/bash_completion" ] && \. "$HOMEBREW_HOME/opt/nvm/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/Users/tdebarochez/.bun/_bun" ] && source "/Users/tdebarochez/.bun/_bun"

# Bun
export BUN_INSTALL="/Users/tdebarochez/.bun"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/tdebarochez/.miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/tdebarochez/.miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/tdebarochez/.miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/tdebarochez/.miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.zsh/p10k.zsh ]] || source ~/.zsh/p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH=$HOMEBREW_HOME/bin:$PATH

# Local (to this machine) configuration
# SHOULD BE LAST
if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi