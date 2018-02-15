zplug "marzocchi/zsh-notify", \
      use:"notify.plugin.zsh", \
      hook-build:"brew install wmctrl xdotool"
zstyle ':notify:*' command-complete-timeout 2

zplug "BurntSushi/ripgrep", \
      from:gh-r, \
      as:command, \
      rename-to:rg

zplug "junegunn/fzf-bin", \
      from:gh-r, \
      as:command, \
      rename-to:fzf, \
      on:"BurntSushi/ripgrep"
export FZF_DEFAULT_COMMAND='rg --files --hidden'
zplug "junegunn/fzf", \
      as:command, \
      use:"bin/fzf-tmux", \
      on:"junegunn/fzf-bin"

zplug "plugins/emacs", from:oh-my-zsh

zplug "stedolan/jq", \
      from:gh-r, \
      as:command, \
      rename-to:jq

POWERLEVEL9K_INSTALLATION_PATH=$ZPLUG_REPOS/bhilburn/powerlevel9k
zplug "bhilburn/powerlevel9k", \
      use:powerlevel9k.zsh-theme, \
      hook-build:"sudo apt install -y fonts-powerline"
