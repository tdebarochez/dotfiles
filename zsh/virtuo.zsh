
_virtuo.js_yargs_completions() {
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" $VIRTUO_HOME/bin/virtuo.js --get-yargs-completions "${words[@]}"))
  IFS=$si
  _describe 'values' reply
}
compdef _virtuo.js_yargs_completions virtuo.js
compdef _virtuo.js_yargs_completions v

export VIRTUO_HOME=$HOME/Prog/virtuo/integration
export PATH=$PATH:$VIRTUO_HOME/bin

export PATH=/opt/homebrew/bin:$PATH

alias v='virtuo.js'
