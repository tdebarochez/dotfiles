alias szshrc='source ~/.zshrc'
alias du='du -h'
alias df='df -h'
alias f='find -iname'
alias v='vim'
alias install='sudo apt-get install'

# Multitail with basic java colorization
alias mu='multitail -cS apache -cS log4j -n 1000 --no-repeat -b 2 --mark-interval 2'

# History with timestamps and elapsed time
alias h='history -iD'

# ls
alias ls='gls                                  --classify --group-directories-first --color=auto'
alias  l='gls -l              --human-readable --classify --group-directories-first --color=auto'
alias ll='gls -l              --human-readable --classify --group-directories-first --color=auto'
alias la='gls -l --almost-all --human-readable --classify --group-directories-first --color=auto'

# More verbose fileutils
alias cp='nocorrect gcp -iv' # -i to prompt for every file
alias mv='nocorrect gmv -iv'
alias rm='nocorrect grm -Iv' # -I to prompt when more than 3 files
alias rmdir='grmdir -v'
alias chmod='gchmod -v'
alias chown='gchown -v'

# ZSH global aliases for piping
# Example : cat myfile.txt G pattern
alias -g G='| grep -in'
alias -g T='| tail'
alias -g L='| less'

# Parent directories
alias cd..='cd ..'
alias '..'='cd ..'
alias dc='cd ..'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias -g .......='../../../../../..'

# Git
alias   g='git'
compdef g=git
alias  gs='git status'
alias gst='git status -s'
alias  gl='git l'
alias  gp='git pull'
alias gaa='git add -A'
alias fetch='git fetch'
alias rebase='git rebase'

# Maven
# Override the mvn command with the colorized one.
alias mvn="mvn-in-colors"
compdef _mvn mvn=mvn-in-colors
alias m='mvn'
compdef _mvn m=mvn
MAVEN_SKIP_TESTS='-Dmaven.test.skip=true' # or -DskipTests
alias   mc='alert printAndRun mvn-in-colors clean'
alias   mt='alert printAndRun mvn-in-colors test'
alias  mct='alert printAndRun mvn-in-colors clean test'
alias  mcp='alert printAndRun mvn-in-colors clean package'
alias mcpt='alert printAndRun mvn-in-colors clean package $MAVEN_SKIP_TESTS'
alias  mpt='alert printAndRun mvn-in-colors package $MAVEN_SKIP_TESTS'
alias  mci='alert printAndRun mvn-in-colors clean install'
alias mcit='alert printAndRun mvn-in-colors clean install $MAVEN_SKIP_TESTS'
alias   mj='printAndRun mvn jetty:run'
alias  mdt="mvn dependency:tree"

alias e="subl -n ."
alias ap="ansible-playbook -i hosts"
alias nr="npm run"
