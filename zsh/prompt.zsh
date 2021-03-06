autoload -U promptinit
promptinit

# Enable parameter expansion, command substitution and arithmetic expansion in prompts
setopt prompt_subst

# Load the colors
autoload -U colors;
colors;

# Create a separation bar after the path
# see: http://aperiodic.net/phil/prompt/
function precmd {
  # Compute the lengths of the strings
  local exitcodesize=${#${(%):-%(?..%? )}}
  local promptsize=${#${(%):-hh-mm-ss-}}
  local pwdsize=${#${(%):-%~}}
  local usersize=${#${(%):-%n@%m}}

  # Global width
  local TERMWIDTH
  (( TERMWIDTH = ${COLUMNS} - 2 ))

  # The horizontal bar
  PR_FILLBAR=""
  # The path, truncated if too long
  PR_PWDLEN=""

  # Compute the path length and the horizontal bar
  if [[ "$promptsize + $pwdsize + $exitcodesize + $usersize" -gt $TERMWIDTH ]]; then
    ((PR_PWDLEN=$TERMWIDTH - $promptsize - $exitcodesize - $usersize))
  else
    PR_FILLBAR="\${(l.(($TERMWIDTH - ($promptsize + $pwdsize + $exitcodesize + $usersize)))..—.)}"
  fi

}

# Change user/host color if root
if [ $UID -eq 0 ]; then usercolor="red"; else usercolor="green"; fi

if tput setaf 1 &> /dev/null; then
    tput sgr0
    if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
      BASE03=$(tput setaf 234)
      BASE02=$(tput setaf 235)
      BASE01=$(tput setaf 240)
      BASE00=$(tput setaf 241)
      BASE0=$(tput setaf 244)
      BASE1=$(tput setaf 245)
      BASE2=$(tput setaf 254)
      BASE3=$(tput setaf 230)
      YELLOW=$(tput setaf 136)
      ORANGE=$(tput setaf 166)
      RED=$(tput setaf 160)
      MAGENTA=$(tput setaf 125)
      VIOLET=$(tput setaf 61)
      BLUE=$(tput setaf 33)
      CYAN=$(tput setaf 37)
      GREEN=$(tput setaf 64)
    else
      BASE03=$(tput setaf 8)
      BASE02=$(tput setaf 0)
      BASE01=$(tput setaf 10)
      BASE00=$(tput setaf 11)
      BASE0=$(tput setaf 12)
      BASE1=$(tput setaf 14)
      BASE2=$(tput setaf 7)
      BASE3=$(tput setaf 15)
      YELLOW=$(tput setaf 3)
      ORANGE=$(tput setaf 9)
      RED=$(tput setaf 1)
      MAGENTA=$(tput setaf 5)
      VIOLET=$(tput setaf 13)
      BLUE=$(tput setaf 4)
      CYAN=$(tput setaf 6)
      GREEN=$(tput setaf 2)
    fi
    BOLD=$(tput bold)
    RESET=$(tput sgr0)
else
    # Linux console colors. I don't have the energy
    # to figure out the Solarized values
    MAGENTA="\033[1;31m"
    ORANGE="\033[1;33m"
    GREEN="\033[1;32m"
    PURPLE="\033[1;35m"
    WHITE="\033[1;37m"
    BOLD=""
    RESET="\033[m"
fi
# Finally, set the prompt
local user_and_host="%{$ORANGE%}%n%{$BASE1%}@%{$YELLOW%}%m%{$BASE1%}"
local the_date="%{$BASE1%}%D{%H:%M:%S}%{$reset_color%}"
local last_command_status="%(?..%{$MAGENTA%}%? %{$reset_color%})"
local start_of_input="%{$fg_bold[white]%}$%{$reset_color%}"
#$ORANGE\u$BASE1@$YELLOW\h$BASE1:$GREEN\w$BASE1
PROMPT='$the_date $ORANGE$user_and_host:%{$GREEN%}%$PR_PWDLEN<...<%~%<<%{$reset_color%} $last_command_status%{$BASE0%}${(e)PR_FILLBAR}%{$reset_color%}
$start_of_input '

# Git prompt, displayed at right (RPROMPT)
# See: https://github.com/olivierverdier/zsh-git-prompt
RPROMPT='$(git_super_status)'
