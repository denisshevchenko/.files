# Aliases for Cabal
alias cba='cabal build all'

# Aliases for NeoVim
alias cl='clear'
alias nv='nvim'
alias vim='nvim'

# Aliases for Git.
alias gb='git branch'
alias gd='git diff'
alias gl='git log'
alias gs='git status'
alias ga='git add .'

# Vi-mode in Bash
set -o vi

# Default terminal is NeoVim
export VISUAL=nvim
export EDITOR="$VISUAL"

# Show current Git branch in the prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (⎇ \1)/'
}
PROMPT="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
export PS1=$PROMPT

# Keep the same prompt inside nix-shell.
keep_prompt_in_nix_shell() {
  if [ "$PS1" != "$PROMPT" ]; then
    PS1="\[\033[0;34m\][nix-shell] \[\033[0m\]${PROMPT}"
    PROMPT_COMMAND=""
  fi
}

PROMPT_COMMAND=keep_prompt_in_nix_shell
export PS1=$PROMPT
