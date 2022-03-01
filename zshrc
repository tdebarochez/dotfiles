# zgen
source ~/.zgen/zgen.zsh
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

  # Remove Zsh completion cache, given we may have updated a completion
  rm ~/.zcompdump || true

  zgen save
fi

# Load ASDF
# Needs to be done before compinit in config.zsh
. $HOME/.asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)

source ~/.zsh/config.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/bindkey.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/fzf.zsh

# Load rupa Z: quickly jump to recent directory with the z command
# Example: z foo
# See: https://github.com/rupa/z
source ~/.rupa-z/z.sh

source ~/.zsh/virtuo.zsh

source $HOME/.cargo/env
source $HOME/.asdf/asdf.sh

# Load direnv through asdf
eval "$(asdf exec direnv hook zsh)"
# A shortcut for asdf managed direnv.
direnv() { asdf exec direnv "$@"; }

# Local (to this machine) configuration
# SHOULD BE LAST
if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi
