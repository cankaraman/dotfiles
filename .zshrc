export PATH="$PATH:/Users/cankaraman/development/flutter/bin"
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH="$PATH:/opt/homebrew/bin"
export PATH="$PATH:$HOME/.pub-cache/bin"
export PATH="$PATH:/Users/cankaraman/Library/Android/sdk/platform-tools"
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
export PATH="$PATH:/Users/cankaraman/.gem/ruby/2.6.0/bin"
export LANG=en_US.UTF-8
export ANDROID_SDK_ROOT="/Users/cankaraman/Library/Android/sdk"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_311.jdk/Contents/Home"
export PATH="$PATH:$JAVA_HOME/bin"
HISTFILESIZE=10000
HISTSIZE=10000

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export EDITOR="/opt/homebrew/bin/nvim"

alias nvim="XDG_CONFIG_HOME=~/.config/astroconfig nvim"
alias vim="XDG_CONFIG_HOME=~/.config/astroconfig nvim"
alias vc="cd ~/.config/nvim && nvim init.vim"
alias vx="cd ~/.config/astroconfig/nvim && nvim lua/user/init.lua"
alias zc="cd ~ && nvim .zshrc"
alias dm="cd ~/StudioProjects/demo_app_classic && nvim lib/app_wrapper.dart"
