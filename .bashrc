# added by travis gem
[ -f /Users/bryanfinlayson/.travis/travis.sh ] && source /Users/bryanfinlayson/.travis/travis.sh

rvm use ruby-2.2.0
export PROMPT_DIRTRIM=3
export EDITOR=vim
## #Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting ---- YOU MIGHT NEED TO REMOVE THIS 
