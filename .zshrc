# Set up the prompt
autoload -Uz promptinit
promptinit
prompt walters

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

#PATH setting
PATH=/usr/local/bin:$PATH
export MANPATH=/usr/local/share/man:/usr/local/man:/usr/share/man
#Language setting
export LANG=ja_JP.UTF-8
#export LANG=ja_JP.eucJP

# エイリアスの設定
  #ls系のalias
  alias ls='ls --color=auto'
  alias ll='ls -ltr'
  alias lg='ls -g'
  alias la='ls -A'
  alias lm='ls | more'
  alias gd='dirs -v; echo -n "select number: "; read newdir; cd +"$newdir"'
alias e='exit'
alias psag='ps aux | grep'

# 関数
find-grep () { find . -type f -print | xargs grep -n --binary-files=without-match $@ }


# プロンプトの設定 //上でしてるのでしない
# PROMPT='%~$ '
# ヒストリの設定
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000


# 履歴ファイルに時刻を記録
setopt extended_history

# 補完するかの質問は画面を超える時にのみに行う｡
LISTMAX=0

autoload -Uz compinit; compinit

# sudo でも補完の対象
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

# cdのタイミングで自動的にpushd
setopt auto_pushd 

# 複数の zsh を同時に使う時など history ファイルに上書きせず追加
setopt append_history

# 補完候補が複数ある時に、一覧表示
setopt auto_list

# 保管結果をできるだけ詰める
setopt list_packed

# 補完キー（Tab, Ctrl+I) を連打するだけで順に補完候補を自動で補完
#setopt auto_menu

# カッコの対応などを自動的に補完
setopt auto_param_keys

# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash

# ビープ音を鳴らさないようにする
setopt no_beep

# 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_dups
# ヒストリにhistoryコマンドを記録しない
setopt hist_no_store
# 余分なスペースを削除してヒストリに記録する
setopt hist_reduce_blanks
# 行頭がスペースで始まるコマンドラインはヒストリに記録しない
#setopt hist_ignore_spece
# 重複したヒストリは追加しない
 setopt hist_ignore_all_dups
# ヒストリを呼び出してから実行する間に一旦編集できる状態になる
setopt hist_verify

# auto_list の補完候補一覧で、ls -F のようにファイルの種別をマーク表示しない
setopt no_list_types

# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst

# ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt mark_dirs

# 8 ビット目を通すようになり、日本語のファイル名を表示可能
setopt print_eight_bit

# シェルのプロセスごとに履歴を共有
setopt share_history

# Ctrl+wで､直前の/までを削除する｡
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# ファイルリスト補完でもlsと同様に色をつける｡
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# cd をしたときにlsを実行する
function chpwd() { ls }

# ディレクトリ名だけで､ディレクトリの移動をする｡
setopt auto_cd

# C-s, C-qを無効にする。
setopt no_flow_control

#ls color setting
LS_COLORS="no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:ex=01;32:*.tar=01;31"
export LS_COLORS
alias tvi='vim.tiny -u .tiny_vimrc'
alias xx='startx'

if [ -f ~/.local_zshrc ]; then
  source ~/.local_zshrc
fi

#git alias
alias gb="git branch"
alias ga="git add"
alias gc="git checkout"
alias gl="git log"
alias gs="git status"
alias gd="git diff"
alias gs="git status"
alias gco="git commit"
alias ghubp="git push -u origin master"

#tags
alias ctags='ctags -f .tags'

# gitのブランチ名と変更状況をプロンプトに表示する 
autoload -Uz is-at-least
if is-at-least 4.3.10; then
  # バージョン管理システムとの連携を有効にする 
  autoload -Uz vcs_info
  autoload -Uz add-zsh-hook

  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:git:*' check-for-changes true
  zstyle ':vcs_info:git:*' stagedstr "+"
  zstyle ':vcs_info:git:*' unstagedstr "-"
  zstyle ':vcs_info:git:*' formats '@%b%u%c'
  zstyle ':vcs_info:git:*' actionformats '@%b|%a%u%c'

  # VCSの更新時にPROMPTを自動更新する
  function _update_vcs_info_msg() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
    psvar[2]=$(_git_not_pushed)
  }
  function _git_not_pushed() {
  if [ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = "true" ]; then
    head="$(git rev-parse HEAD)"
    for x in $(git rev-parse --remotes)
    do
      if [ "$head" = "$x" ]; then
        return 0
      fi
    done
    echo "?"
  fi
  return 0
  }
add-zsh-hook precmd _update_vcs_info_msg
fi

alias go="cd /home/nt/workspace/lap/LapDevice/test"
