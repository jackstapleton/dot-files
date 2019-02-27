
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
  }

export PS1="\[\033[35m\]\$(parse_git_branch) \[\033[95m\]\w \[\033[00m\]$ "
export GREP_OPTIONS='--color=auto'
export PATH="$PATH:~/anaconda3/bin"
