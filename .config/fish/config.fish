set    fish_greeting

if not test -d ~/.asdf
  set -U fish_user_paths ~/bin
else
  set -U fish_user_paths ~/bin ~/.asdf/bin ~/.asdf/shims
end

export FZF_DEFAULT_OPTS='--height=50% --min-height=15 --reverse'
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export LPS_DEFAULT_USERNAME='sidneyliebrand@gmail.com'
export EVENT_NOKQUEUE=1

if command -s nvim >/dev/null
  export EDITOR='nvim'
else
  export EDITOR='vim'
end

if not set -q __initialized
  set -U __initialized

  # config files
  abbr vv  "$EDITOR ~/.vimrc"
  abbr tt  "$EDITOR ~/.tmux.conf"
  abbr zz  "$EDITOR ~/.config/fish/config.fish"
  abbr zx  "source ~/.config/fish/config.fish"
  abbr ff  "$EDITOR ~/.config/fish/config.fish"

  # crystal
  abbr cr  'crystal'
  abbr csh 'shards'
  abbr cpl 'crystal play'
  abbr csp 'crystal spec'

  # git
  abbr g   'git'
  abbr ga  'git add'
  abbr g.  'git add .'
  abbr gb  'git branch'
  abbr gbl 'git blame'
  abbr gc  'git commit -m'
  abbr go  'git checkout'
  abbr gcp 'git cherry-pick'
  abbr gd  'git diff'
  abbr gf  'git fetch'
  abbr gl  'git log'
  abbr gm  'git merge'
  abbr gp  'git push'
  abbr gpl 'git pull'
  abbr gr  'git remote'
  abbr gs  'git status'
  abbr gst 'git stash'

  # vim
  abbr v   "$EDITOR"
  abbr v.  "$EDITOR ."
  abbr vip "$EDITOR +PlugInstall +qall"
  abbr vup "$EDITOR +PlugUpdate"
  abbr vcp "$EDITOR +PlugClean +qall"
end

[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

if status --is-interactive
and command -s tmux >/dev/null
and not set -q TMUX
  exec tmux new -A -s (whoami)
end
