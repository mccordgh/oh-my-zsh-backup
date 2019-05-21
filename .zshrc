# Path to your oh-my-zsh installation.
export ZSH=/Users/matthewmccord/.oh-my-zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/rObbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="af-magic"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal liases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias iossim="/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app/Contents/MacOS/Simulator"
alias iphonex="/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app/Contents/MacOS/Simulator --CurrentDeviceUDID com.apple.CoreSimulator.SimDeviceType.iPhone-X"
alias burnitalldown='rm -rf node_modules && npm install'
alias cheatsheet='curl cht.sh'
alias pico8-'/Applications/PICO-8.app/Contents/MacOS/pico8'
alias love='/Applications/love.app/Contents/MacOS/love'
alias ngrok='~/ngrok'
alias crun='dotnet build && dotnet run'
alias gotopico='cd ~/Library/Application\ Support/pico-8/carts/'
alias disttoghpages='git subtree push --prefix dist origin gh-pages'
alias cleanup='brew update && brew upgrade && brew cleanup && npm -g outdated'
alias cda='composer dumpautoload'
alias newbuild='git add dist/ && git commit -m "new build"'
alias a='php artisan'
alias gbD='git branch -D'
alias omg='vim ~/.zshrc'
alias omgz='source ~/.zshrc'
alias f='git grep --heading --break --line-number'
alias sniff='php -d memory_limit=-1 ./vendor/bin/phpcs --standard=psr2'
alias pushdist='git subtree push --prefix dist origin gh-pages'
alias last-hotfix='git ls-remote --heads | grep -iE "\/hotfix-\d{4}$" | cut -d"/" -f3 | tail -n1'
alias gs='git status'
alias vmh='vue-migration-helper'
alias ga='git add'
alias phpserv='php -S localhost:8000 -t public'
alias gap='git add -p'
alias gcm='git commit -m'
alias gc='git checkout'
alias gcd='git checkout develop'
alias gcp='git cherry-pick'
alias tinker='composer dumpautoload && php artisan tinker'
alias gpush='git push'
alias gpull='git pull'
alias gpo='git push origin'
alias gpuo='git pull origin'
alias gph='git push origin HEAD'
alias gfetch='git fetch'
alias ..='cd ..'
# alias gf='gulp --front'
# alias GF='gulp --front'
alias g1='git log --oneline'
alias exot='exit'
alias gg='git grep'
alias splay='spotify play'
alias spause='spotify pause'
alias snext='spotify next'
alias statme='stat -f%z dist/build-js13k.zip'
alias yrl='yarn run lint'
# alias rununittest='./vendor/bin/phpunit -c phpunit.xml'
# alias runspectest='./vendor/bin/phpspec -v run'
# alias runphpcstestapp='php -d memory_limit=-1 ./vendor/bin/phpcs -p --standard="./phpcs.xml" --extensions=php,inc,module,install app'
# alias runphpcstestlegacy='php -d memory_limit=-1 ./vendor/bin/phpcs -p --standard="./phpcs.xml" --extensions=php,inc,module,install -n --exclude="Squiz.ControlStructures.ControlSignature" legacy public/*.php public/includes public/modules public/themes public/sites/default public/sites/all/themes public/sites/all/modules'
voice () {
    vagrant up
    PORT=`vagrant port | grep "80 (guest)" | tr -s ' ' | cut -d ' ' -f5`
    ngrok http $PORT -subdomain=ddd-alexa-matt
}
function buildme() {
    rm -rf dist/
    npm run build
    rm dist/build.zip dist/index.html.gz dist/script.js.gz
    zip dist/build-js13k.zip -r dist/index.html dist/src/
    # zip dist/build-js13k.zip -r dist/
    advzip -z -4 dist/build-js13k.zip
    git add dist/
    git commit -m "new build"
}
function fp() {
    f "path......$1"
}
function gbmerged() {
for branch in `comm -12  <(git branch --merged|awk '{print($1)}') <(git branch -r --merged|awk '{print($1)}'|awk -F \/ '{print($2)}')`;do echo -e `git show --format="%ci %cr %an" $branch | head -n 1` \\t$branch; done | sort -r
}
function gbnotmerged() {
for branch in `comm -12  <(git branch --no-merged|awk '{print($1)}') <(git branch -r --no-merged|awk '{print($1)}'|awk -F \/ '{print($2)}')`; do echo -e `git show --format="%ci %cr %an" $branch | head -n 1` \\t$branch; done | sort -r
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

PATH="$PATH:~"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
PATH="/usr/local/opt/php@7.0/bin:$PATH"

# Add Google Flutter to PATH
PATH="$PATH:/Users/matthewmccord/Workspace/flutter/bin/flutter"

# load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Android SDK
export ANDROID_HOME=~/Library/Android/sdk
PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools/bin

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Help compilers find keg-only brew installs (mono-libgdiplus)
export LDFLAGS="-L/usr/local/opt/readline/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include"

# Get more verbose expo errors / etc
export EXPO_DEBUG=true

# Add libffi to package config path
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/opt/libffi/lib/pkgconfig"

