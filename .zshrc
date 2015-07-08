unsetopt ignoreeof

# BT
alias -r dev1-server='MAVEN_OPTS="-Xmx3072m -XX:MaxPermSize=512M -XX:+CMSClassUnloadingEnabled -XX:+CMSPermGenSweepingEnabled -Djavax.net.ssl.keyStore=`pwd`/src/test/resources/keystore/dwgps0022.btfin.com.jks -Djavax.net.ssl.trustStore=`pwd`/src/test/resources/keystore/dwgps0022.btfin.com.jks -Djavax.net.ssl.trustStorePassword=YTMvhQq7YvwwawDh -Djavax.net.ssl.keyStorePassword=YTMvhQq7YvwwawDh -Dstub.webservice.filestub=false -Davaloq.webservice.filestub=false -Dapplication-submission.webservice.filestub=false -DavaloqStatic.webservice.filestub=false -Djpa.dialect=org.hibernate.dialect.Oracle9Dialect -Djpa.showSql=true -Djdbc.driver=oracle.jdbc.driver.OracleDriver -Djdbc.url=jdbc:oracle:thin:@ngwdw-vip.wsdc.nsw.westpac.com.au:1410/PERD1 -Djdbc.username=PER_OWNER_DEV1 -Djdbc.password=PER_OWNER_DEV1_pwd -Dwebclient.resource.location=file:`pwd`/../nextgen-ip-ui/webapp/" mvn clean tomcat7:run'

# Setup vim
alias -r gvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
alias -r v=gvim

# Vagrant
alias -r vdu="vagrant destroy -f && vagrant up"

# Always try listing in color
alias -r ls='ls -G'

# Controlling itunes
alias -r play="osascript -e 'tell app \"iTunes\" to playpause'"
alias -r next="osascript -e 'tell app \"iTunes\" to next track'"
alias -r prev="osascript -e 'tell app \"iTunes\" to previous track'"

# print out shell colors
alias -r colors='for code in {000..255}; do print -P -- "$code: %F{$code}Test%f"; done'

# lua love `love .` should launch a game
alias -r love='/Applications/love.app/Contents/MacOS/love'

# time http requests
alias -r curlperf="curl -o /dev/null -s -w %{time_connect}:%{time_starttransfer}:%{time_total}"
alias -r curlxhr="curl -H 'X-Requested-With: XMLHttpRequest'"

# password management
alias -r pc="pass -c"
function pg {
    pass generate -c $1 20
}

# find a file in the current directory quickly
function ff {
    find . -iname "*$1*"
}

# gsub some text with something else in place. (NOTE: not perfect)
function gsub {
    if [[ $3 != "" ]]; then
        find . -type f -iname "*.$3" -exec perl -p -i -e "s/$1/$2/g" {} \;
    else
        find . -type f -exec perl -p -i -e "s/$1/$2/g" {} \;
    fi
}

alias -r gpom="git push origin master"
alias -r gpod="git push origin development"
alias -r gpr="git pull --rebase"
function gbd {
    git log $1 \^$2 --no-merges --oneline
}

# virtualenv and wrapper. (NOTE: this is a bit slow... should probably diagnose that)
#export WORKON_HOME=~/.envs
#source /usr/local/bin/virtualenvwrapper.sh

# rvm.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Use vi keybindings
bindkey -v

# Setup history
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=$HOME/._zshhistory
setopt append_history
setopt inc_append_history
setopt extended_history
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt hist_no_store
setopt hist_no_functions
setopt no_hist_beep
setopt hist_save_no_dups

# Search history if there's a partial command on the buffer.
# ^up and ^down do a search with the entire contents of the buffer up to the cursor
bindkey '^[[1;5A' history-beginning-search-backward
bindkey '^[[1;5B' history-beginning-search-forward

# up and down do a prefix search up to the first space in the buffer
bindkey '\e[A'  history-search-backward  # Up
bindkey '\e[B'  history-search-forward   # Down

# Setup my prompt
autoload colors zsh/terminfo
autoload -Uz vcs_info

# Make it so the prompt actually works.
setopt prompt_subst

precmd () { 
    vcs_info 
}

CURRENT_BG='NONE'
SEGMENT_SEPARATOR=''

prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n " %{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%} "
  else
    echo -n "%{$bg%}%{$fg%} "
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n $3
}

# End the prompt, closing any open segments
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "%{%f%} $"
  CURRENT_BG=''
}

prompt_cwd() {
    prompt_segment 214 238 '%~ '
}

prompt_user() {
    prompt_segment 027 015 '%n '
}

prompt_git() {
    if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
        prompt_segment 112 237 "${vcs_info_msg_0_}"
    fi
}

# Set git styling
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' stagedstr "*"
zstyle ':vcs_info:*' unstagedstr "*"
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git*' formats "@%b"

## Main prompt
build_prompt() {
  RETVAL=$?
  prompt_user
  prompt_cwd
  prompt_git
  prompt_end
}

PROMPT='%{%f%b%k%}$(build_prompt) '

# The following lines were added by compinstall

fpath=(~/.zsh/completion $fpath)

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' file-sort name
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:]}={[:upper:]}'
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=34}:${(s.:.)LS_COLORS}")';
zstyle ':completion:*' max-errors 3
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' substitute 1
zstyle :compinstall filename '/Users/sam/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
