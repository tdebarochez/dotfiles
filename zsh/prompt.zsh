# Original idea: http://aperiodic.net/phil/prompt/

# Enable parameter expansion, command substitution and arithmetic expansion in prompts
setopt prompt_subst

# Load the colors
autoload -U colors
colors


# Configure ZSH vcs module
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats "%b %u%c"
zstyle ':vcs_info:*' actionformats "%b %u%c %a"
zstyle ':vcs_info:*' check-for-changes true


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

function build_prompt {
    # Exit code of last command
    # - Needs to be computed first
    # - if not zero, add a space after it
    local -r exit_code="${(%):-%(?..%? )}"

    # Prompt elements
    vcs_info
    local -r gitinfo="${vcs_info_msg_0_%% }" # Trim possible trailing space
    local -r time="$(date +"%T")"
    local -r user_and_host="%n@%m"
    local -r cwd="%$((COLUMNS/2))<..<%~%<<"

    # Build prompt
    local -r colored_exit="%F$MAGENTA$exit_code%f"
    local -r colored_time="%F$BASE1$time%f"
    local -r colored_user_host="%F$ORANGE%n@%F$YELLOW%m%f"
    local -r colored_path="%F$GREEN$cwd%f"
    local -r colored_bar="%F$BASE1$bar%f"
    # Color GIT info depending of status: unstaged/staged
    if [[ $gitinfo = *[\ ]* ]]; then
      local -r colored_gitinfo="%F$YELLOW$gitinfo%f"
    else
      local -r colored_gitinfo="%F$VIOLET$gitinfo%f"
    fi

    local -r start_of_input="%B%F{white}$%f%b"
    PROMPT="$colored_time $colored_user_host:$colored_path $colored_gitinfo $colored_exit
$start_of_input "
}

add-zsh-hook precmd build_prompt


