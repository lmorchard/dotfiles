export PATH=node_modules/.bin:$HOME/.local/bin:/usr/local/sbin:$HOME/.local/adt-bundle-mac-x86_64-20130522/sdk/platform-tools/:$PATH
export MANPATH=$HOME/.local/man:/opt/local/man:/usr/local/man:$MANPATH 
export LC_CTYPE=en_US.UTF-8
export CLICOLOR=y
export LESS='-XRF'
alias mq='hg -R $(hg root)/.hg/patches'
ln -fs $SSH_AUTH_SOCK ~/.ssh/auth_sock

unsetopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
unsetopt APPEND_HISTORY

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

if [[ "$OSTYPE" == "linux-gnu" ]]; then

    export EDITOR=vim

elif [[ "$OSTYPE" == "darwin"* ]]; then

    export PATH=$HOME/Applications:/Applications:/Developer/usr/bin:/usr/local/Cellar/ccache/3.1.8/libexec:$HOME/.local/adt-bundle-mac-x86_64-20130522/sdk/platform-tools/:$PATH
    export ANDROID_HOME=$HOME/.local/android-sdk-macosx
    export VIM_APP_DIR=$HOME/Applications
    export EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim -g -c "au VimLeave * maca hide:" -f'
    export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/

elif [[ "$OSTYPE" == "cygwin" ]]; then
    # POSIX compatibility layer and Linux environment emulation for Windows
elif [[ "$OSTYPE" == "msys" ]]; then
    # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
elif [[ "$OSTYPE" == "win32" ]]; then
    # I'm not sure this can happen.
elif [[ "$OSTYPE" == "freebsd"* ]]; then
    # ...
else
    # Unknown.
fi
