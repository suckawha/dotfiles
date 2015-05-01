# set the default text editor
export EDITOR="/usr/local/bin/atom"

# set the lolcommits delay
export LOLCOMMITS_DELAY=1

# start up rbenv
eval "$(rbenv init -)"

# set up the local bin path
export PATH="/usr/local/heroku/bin:$PATH"
export PATH=./bin:$PATH

# start up z
. /usr/local/Cellar/z/**/z.sh

# set up andoird path
export ANDROID_HOME=/usr/local/opt/android-sdk
