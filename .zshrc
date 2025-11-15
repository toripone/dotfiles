eval "$(zoxide init zsh)"
autoload -Uz colors && colors
autoload -Uz compinit && compinit
fpath=(~/.config/zsh-completions/src $fpath)
alias python="python3"
alias ll="ls -al"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/opt/zsh-git-prompt/zshrc.sh

git_prompt() {
 if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = true ]; then
     PROMPT="%F{green}%n%f %F{cyan}($(arch))%f:%F{blue}%~%f $(git_super_status)"$'\n'"%# "
 else
    PROMPT="%F{green}%n%f %F{cyan}($(arch))%f:%F{blue}%~%f"$'\n'"%# "
 fi
}

precmd() {
  git_prompt
}
