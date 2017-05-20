source $BREW_PREFIX/share/antigen/antigen.zsh

setopt HIST_IGNORE_SPACE

export _ANTIGEN_CACHE_ENABLED=true

POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k

antigen use oh-my-zsh

antigen init $HOME/.antigenrc

antigen apply

alias pip3freeze='pip3 list --not-required --user --format freeze'
