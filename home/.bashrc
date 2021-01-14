if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    GIT_PROMPT_END=' \nζ '
    source $HOME/.bash-git-prompt/gitprompt.sh
fi

export PS1='\[\033[33m\]\w \[\033[0m\]\nζ '
alias snip='git branch -vv | awk "/: gone]/{print \$1}" | xargs git branch -d'
