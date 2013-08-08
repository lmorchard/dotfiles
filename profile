export PATH=node_modules/.bin:$HOME/.local/bin:$HOME/Applications:/Applications:/usr/local/sbin:/Developer/usr/bin:/usr/local/Cellar/ccache/3.1.8/libexec:$HOME/.local/adt-bundle-mac-x86_64-20130522/sdk/platform-tools/:$PATH
export MANPATH=$HOME/.local/man:/opt/local/man:/usr/local/man:$MANPATH 
export LC_CTYPE=en_US.UTF-8
export VIM_APP_DIR=$HOME/Applications
export EDITOR='/Users/lorchard/Applications/MacVim.app/Contents/MacOS/Vim -g -c "au VimLeave * maca hide:" -f'
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/
export CLICOLOR=y
export LESS='-XRF'

alias mq='hg -R $(hg root)/.hg/patches'

ln -fs $SSH_AUTH_SOCK ~/.ssh/auth_sock
