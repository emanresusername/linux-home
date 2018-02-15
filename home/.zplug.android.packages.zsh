zplug "plugins/emacs", \
      from:oh-my-zsh, \
      hook-build:"termux-fix-shebang plugins/emacs/*"

zplug "junegunn/fzf-bin", \
      from:gh-r, \
      as:command, \
      rename-to:fzf, \
      use:"*linux_arm8*"

zplug "junegunn/fzf", \
      as:command, \
      use:"bin/fzf-tmux", \
      on:"junegunn/fzf-bin", \
      hook-build:"termux-fix-shebang bin/*"

POWERLEVEL9K_INSTALLATION_PATH=$ZPLUG_REPOS/bhilburn/powerlevel9k
zplug "bhilburn/powerlevel9k", \
      use:powerlevel9k.zsh-theme
