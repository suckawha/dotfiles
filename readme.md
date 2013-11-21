# Setup

This is a guide to setting up my personal development environment. Its purpose is to allow me to get up and running as quick as possible.

This guide assumes you're using a Mac with the latest version of OS X.

## Prerequisits

Before you do anything else, run Software Update.

Once that's done, install:

* [Google Chrome](https://www.google.com/intl/en/chrome/browser/)
* [Sublime Text 2](http://www.sublimetext.com/3)
* [Google Drive](https://tools.google.com/dlpage/drive)
* [iStat Menus](http://bjango.com/mac/istatmenus/)

Then install these from the AppStore:

* Xcode
* BetterSnapTool
* iA Writer
* The Unarchiver
* Alfred
* Clear
* Caffine
* ColorSnapper
* Screenshot PSD

Install the XCode Command Line Tools by opening XCode, navigating to Preferences > Downloads > Components and clicking on the Install button.

## Homebrew

[Homebrew](http://mxcl.github.com/homebrew/) is a bad ass little package manager for OS X. To install it, run:

```
ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
brew doctor
brew update
export PATH='/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin'
```

The last line sets the `$PATH` environment variable. This only needs to be done for the current shell session. Once you set up Oh My ZSH later on in this guide, this variable will be set whenever the shell starts.

Install some handy little command line utilities using Homebrew:

```
brew install wget
brew install tree
brew install ack
```

To browser all of the available Homebrew packages, check out [Braumeister](http://braumeister.org/).

## Git

The XCode Command Line Tools includes Git, but it's not the latest version. To install the current version, run:

```
brew install git
```

Next, configure it:

```
git config --global credential.helper osxkeychain
git config --global user.name "Landon Schropp"
git config --global user.email schroppl@gmail.com
git config --global alias.co checkout
git config --global alias.a add
git config --global alias.c commit
git config --global alias.b branch
git config --global alias.m merge
git config --global alias.s status
git config --global core.editor "subl -w"
git config --global push.default simple
git config --global color.ui true
git config --global core.mergeoptions --no-edit
```

In order to connect with GitHub, you'll need to generate an SSH key. Follow the [instructions](https://help.github.com/articles/generating-ssh-keys) on Github.

## Dotfiles and Toolbox

To get all of the settings and script files, clone the [dotfiles](https://github.com/LandonSchropp/dotfiles) repository.

```
git clone git@github.com:LandonSchropp/dotfiles.git $HOME/dotfiles
```

## Oh My ZSH

The [Z shell (zsh)](http://en.wikipedia.org/wiki/Z_shell) is an awesome replacement for the default bash shell that ships with OS X. It includes some greate features such as auto-completion, spelling correction, glob file matching, custom prompts and more.

[Oh My ZSH](https://github.com/robbyrussell/oh-my-zsh) is a framework that manages ZSH, and includes several plugins for zsh as well as an automatic update tool. The installation information for Oh My ZSH was taken from this [Oh My ZSH Railscast](http://railscasts.com/episodes/308-oh-my-zsh).

Install Oh My ZSH by using the following command:

```
wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
```

Next, link the custom Oh My ZSH configuration from the dotfiles repository.

```
mkdir -p $HOME/.oh-my-zsh/custom
rm -r $HOME/.oh-my-zsh/custom/*
ln -s $HOME/dotfiles/oh_my_zsh/* $HOME/.oh-my-zsh/custom/
```

Finally, in order to property change the shell, restart the system.

## iTerm2

iTerm2 is a nifty little terminal replacement. To set up iTerm2, download and install it and open up the preferences. Under the general tab, click the checkbox labeled "Load preferences from a custom folder or URL" and select the `iterm2` folder in the dotfiles repository.

## OS X

Run the OS X script to set some useful OS X preferences. Restart for all of the changes to take effect.

```
source $HOME/dotfiles/osx/osx.zsh
```

## tmux

tmux is a program that splits multiple terminals in the same window. The instructions for installing tmux were taken from [this gist](https://gist.github.com/simme/1297707).

To get started, install tmux with Homebrew.

``` shell
brew install reattach-to-user-namespace
brew install tmux
```

Next, link the tmux configuration file.

``` shell
ln -s $HOME/dotfiles/tmux/tmux.conf $HOME/.tmux.conf
```

[tmuxinator](https://github.com/aziz/tmuxinator) allows you to rapidly create tmux workspaces by storing their configurations in files. Install the tmuxinator gem using the shell.

``` shell
gem install tmuxinator
```
The tmuxinator projects files may be placed in the `~/.tmuxinator` directory.

## GCC

The XCode Command Line Tools includes LLVM-GCC, which can cause problems when compiling Ruby. To fix this, we need to install GCC:

```
brew tap homebrew/dupes
brew install apple-gcc42
```

## Ruby

[rbenv](https://github.com/sstephenson/rbenv) is an awesome little Ruby environment manager. It does one thing really well. To install rbenv, run:

```
brew install rbenv
brew install ruby-build
```

OS X ships with an old version of Ruby. You'll want the latest stable one. Check the official [Ruby language website](http://www.ruby-lang.org/en/) to see what it might be. At the time this document was written, the newest stable Ruby release is `Ruby 1.9.3-p362`.  To install Ruby, run:

```
export CC="/usr/local/bin/gcc-4.2"
export CFLAGS="-I/opt/X11/include"
rbenv install 1.9.3-p327
rbenv global 1.9.3-p327
eval "$(rbenv init -)"
```

You may also want to disable `ri` and `rdoc` documentation from being installed by default.

``` shell
echo "gem: --no-ri --no-rdoc" >> ~/.gemrc
```

## Ruby on Rails

[Ruby on Rails](http://rubyonrails.org/) is easy to install:

```
gem install rdoc
gem install sqlite3
gem install rails
gem install bundler
```

## Sublime Text

Install [Sublime Package Control](http://wbond.net/sublime_packages/package_control) by opening Sublime Text, hitting Control + &#96; and pasting:

```
import urllib.request,os; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); open(os.path.join(ipp, pf), 'wb').write(urllib.request.urlopen( 'http://sublime.wbond.net/' + pf.replace(' ','%20')).read())
```

When that's done, restart Sublime Text 2. Next, add the following packages by hitting Command + Shift + P and typing in Package Control: Install Package:

* Better CoffeeScript
* Emmet
* SCSS
* Dayle Rees Color Schemes
* EasyMotion
* ruby-slim
* Jade
* Stylus
* SublimeCodeIntel

Finally, symbolically link the Sublime Text 2 preferences files from the dotfiles repository:

```
rm -rf "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
mkdir -p "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
ln -s $HOME/dotfiles/sublime_text/Preferences.sublime-settings "$HOME/Library/Application Support/Sublime Text 3/Packages/User/"
```

## NodeJS

[NodeJS](http://nodejs.org/) is a web application framework written in JavaScript. [NPM](https://npmjs.org/) is the best NodeJS package manager. You can use Homebrew to install both:

```
brew install nodejs npm
```

## PostgreSQL

[PostgreSQL](http://www.postgresql.org/) is an open-source SQL database. OS X ships with and old version of PostgreSQL preinstalled. Most of the instructions for installing PostgreSQL were borrowed from [this great Railscast](http://railscasts.com/episodes/342-migrating-to-postgresql?view=asciicast).

To install the newest version, use:

```
brew install postgresql
initdb /usr/local/var/postgres
```

Next, restart the terminal. In order to make sure PostgreSQL starts up when OS X starts up, we need to add a launch agent.

```
mkdir -p $HOME/Library/LaunchAgents
cp "/usr/local/Cellar/postgresql/$(psql --version | perl -wnE 'say for /\d+\.\d+\.\d+/g')/homebrew.mxcl.postgresql.plist" $HOME/Library/LaunchAgents
launchctl load -w $HOME/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
```

## Private Keys

Some APIs require secret access keys and tokens for authentication. For security reasons, these values should not be stored in a git repository.

Create a new Oh My ZSH configuration file.

```
touch ~/.oh-my-zsh/custom/private.zsh
```

Add the Amazon Web Services access key id and secret access key to this file. These keys can be found on the [Security Credentials](https://portal.aws.amazon.com/gp/aws/securityCredentials) page under Access Keys.

```
export AMAZON_ACCESS_KEY_ID="<Access Key ID>"
export AMAZON_SECRET_ACCESS_KEY="<Secret Access Key>"
```
