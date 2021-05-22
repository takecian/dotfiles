# git-promptの読み込み
source ~/dotfiles/zsh/git-prompt.sh

# git-completionの読み込み
fpath=(~/dotfiles/zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/dotfiles/zsh/git-completion.bash
autoload -Uz compinit && compinit

# プロンプトのオプション表示設定
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

# プロンプトの表示設定(好きなようにカスタマイズ可)
setopt PROMPT_SUBST ; PS1='%F{green}%n@%f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f \$ '

# alias
alias up='cd ../'
alias repos='ghq list -p | peco'
alias repo='cd $(repos)'
alias urepo='ghq list | xargs ghq get -u'  # git pull all repositories
alias clone='ghq get'
