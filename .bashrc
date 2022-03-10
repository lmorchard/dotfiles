# ~/.bashrc: executed by bash(1) for non-login shells.

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022

# You may uncomment the following lines if you want `ls' to be colorized:
# export LS_OPTIONS='--color=auto'
# eval "`dircolors`"
# alias ls='ls $LS_OPTIONS'
# alias ll='ls $LS_OPTIONS -l'
# alias l='ls $LS_OPTIONS -lA'
#
# Some more alias to avoid making mistakes:
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'

# https://coderwall.com/p/fasnya/add-git-branch-name-to-bash-prompt
__parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Codespaces bash prompt theme
__bash_prompt() {
    local userpart='`export XIT=$? \
        && [ ! -z "${GITHUB_USER}" ] && echo -n "\[\033[0;32m\]@${GITHUB_USER} " || echo -n "\[\033[0;32m\]\u " \
        && [ "$XIT" -ne "0" ] && echo -n "\[\033[1;31m\]➜" || echo -n "\[\033[0m\]➜"`'
    local lightblue='\[\033[1;34m\]'
    local removecolor='\[\033[0m\]'
    PS1="${userpart} ${lightblue}\w${removecolor}\[\033[33m\]\$(__parse_git_branch)\[\033[00m\] \$ "
    unset -f __bash_prompt
}
__bash_prompt
export PROMPT_DIRTRIM=4
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(rbenv init -)"
export GITHUB_PATH=/workspaces/github
export LAUNCH_PATH=/workspaces/actions/launch
export SKYRISE_PATH=/workspaces/actions/actions-dotnet/src
alias start-actions='/workspaces/github/script/actions/start-actions'
alias stop-actions='/workspaces/github/script/actions/stop-actions'
alias skyrise='cd /workspaces/actions/actions-dotnet/src && ./init.sh'

test -f ~/.git-completion.bash && . $_
