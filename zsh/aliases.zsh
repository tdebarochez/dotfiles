alias szshrc='source ~/.zshrc'
alias du='du -h'
alias df='df -h'
alias free='free -h'
alias f='find -iname'
alias v='vim'
alias meteo='curl http://wttr.in/Paris'
alias up='sudo apt update && sudo apt -V --yes upgrade'
alias ydl="youtube-dl --format best --output '%(upload_date)s.%(title)s.%(ext)s' --restrict-filenames --write-description"
alias rm='safe-rm'

# Multitail with basic java colorization
alias mu='multitail -cS apache -cS log4j -n 1000 --no-repeat -b 2 --mark-interval 2'

# History with timestamps and elapsed time
alias hist='history -iD'

# ls
alias ls='ls    --color=auto'
alias  l='ls -a --color=auto'
alias ll='ls -al --color=auto'
alias la='ls -al --color=auto'

# grep
alias  grep='grep --color=auto'
alias egrep='grep --color=auto'
alias zgrep='grep --color=auto'

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
alias -g B='| bat'

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
alias      g='git'
compdef    g=git
alias     gs='git status'
alias    gst='git status -s'
alias     gl='git log --graph --abbrev-commit --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"'
alias    gll='git l'
alias     gp='git pull; git log -n 1 | grep -q -c "\-\-wip\-\-" && echo "\033[0;33mWARNING: Last commit is a WIP\!\033[0m"'
alias    gaa='git add -A'
alias    gcm='git rev-parse --abbrev-ref origin/HEAD | cut -c8- | xargs -n 1 git checkout' # checkout master/main/develop automatically
alias     gc='git checkout -'
alias    gpf='git push --force-with-lease'
alias   gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify -m "--wip-- [skip ci]"'
alias  gwipp='gwip && git push --force-with-lease'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
# shellcheck disable=SC2142
alias delete-merged-branches="git fetch -p && git for-each-ref --format '%(refname:short) %(upstream:track)' | awk '\$2 == \"[gone]\" {print \$1}' | xargs -r git branch -D"

# Maven
alias m='mvn-in-colors'
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
alias  mdt='mvn dependency:tree'
alias  msb='printAndRun mvn spring-boot:run'

# NPM
alias  ns='printAndRun npm start'
alias nsd='printAndRun npm run start:dev'
alias nsh='printAndRun npm run start:hmr'
alias  nt='printAndRun npm test'
alias ntw='printAndRun npm run test:watch'
# replaced by https://github.com/antfu/ni#ni
alias  nr="printAndRun npm run"

# Scala SBT
alias st='printAndRun sbt ~test-quick'

# Docker compose
alias   dup='alert printAndRun docker-compose up -d'
alias ddown='alert printAndRun docker-compose down -t 5'
alias   dsa='alert printAndRun docker-compose start'
alias   dso='alert printAndRun docker-compose stop'
alias    dl='docker-compose logs'
alias   dlf='docker-compose logs -f'
alias e="subl -n ."
alias ap="ansible-playbook -i hosts"
alias tf="terraform"
alias dc="docker-compose"

# k8s
alias kx='kubectx'
alias k='kubectl'