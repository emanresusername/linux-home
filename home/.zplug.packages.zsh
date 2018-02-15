zplug "b4b4r07/enhancd", \
      use:init.sh, \
      on:"junegunn/fzf-bin"

zplug "emanresusername/zsh-plugins", use:cowfiles

zplug "emanresusername/zsh-plugins", use:s3cmd

zplug "plugins/command-not-found", from:oh-my-zsh

zplug "MichaelAquilina/zsh-emojis"
zplug "emanresusername/oh-my-zsh", \
      use:"lib/clipboard.zsh"
zplug "lib/history", from:oh-my-zsh


zplug "plugins/zsh_reload", from:oh-my-zsh
zplug "plugins/gitfast", from:oh-my-zsh
zplug "plugins/thefuck", from:oh-my-zsh, \
      defer:1 # wait for brew PATH to be set

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "zsh-users/zsh-history-substring-search", \
      on:"zsh-users/zsh-syntax-highlighting", \
      defer:2, \
      hook-load:"
      bindkey -M emacs '^P' history-substring-search-up;
      bindkey -M emacs '^N' history-substring-search-down;
      bindkey '^[[A' history-substring-search-up;
      bindkey '^[[B' history-substring-search-down;
      bindkey -M vicmd 'k' history-substring-search-up;
      bindkey -M vicmd 'j' history-substring-search-down;
"
zplug "emanresusername/linuxbrew-zsh-plugin", \
      use:"linuxbrew.plugin.zsh", \
      at:termux, \
      defer:1 # TODO: only needed in termux

# tmux
zplug "jreese/zsh-titles"
zplug "TBSliver/zsh-plugin-tmux-simple"

if [[ $OSTYPE == darwin* ]]; then
  source "$HOME/.zplug.osx.packages.zsh"
elif [[ $OSTYPE == linux-android ]]; then
  source "$HOME/.zplug.android.packages.zsh"
else
  source "$HOME/.zplug.linux.packages.zsh"
fi

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
