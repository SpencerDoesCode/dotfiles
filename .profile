# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

## Git tab completion
test -f ~/.git-completion.bash && . $_

PATH=~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/mongodb/bin:~/Build/imagemagick/Imagemagick-6.7.2/bin:$PATH

ssh() { /usr/bin/ssh "$@" ; echo -n -e "\033]0;\007" ; }

grepfn() {
	ag $1 *
}

findfn() {
	find . -name $1 | grep -v .svn/
}

get_vim_sessions() {
	cd ~/.vim/session && ls -t ~/.vim/session/*.vim | awk -F "/" '{print $NF}'
}


gitdiff() {
	 git diff --color $1 | diff-so-fancy
}

set listchars=tab:\|-,trail:~

#Lazy log command
export HISTTIMEFORMAT='%F %T '
alias l='ls -laoF'
alias vi='vim'
alias rootvimdiff='root && git diff | vim -'
alias vimdiff='git diff | vim -'
alias ..='cd ..'
alias ...='cd ../..'
alias cd..='cd ..'
alias nike='sudo $(fc -ln -1)'
alias uproot='root && git pull && git status'
alias diffroot='root && git status'
alias cca='gocss && compass compile admin'
alias ccb='gocss && compass compile backend'
alias gp='git pull'
alias gs='git status'
alias gd=gitdiff
PS1='\t | \[`[ $? = 0 ] && X=4 || X=1; tput setaf $X`\]\u\[`tput sgr0`\]: \w $> '

alias sessions=get_vim_sessions

alias g=grepfn
alias f=findfn

# test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
