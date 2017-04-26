source $HOME/.linuxbrew/share/antigen/antigen.zsh

setopt HIST_IGNORE_SPACE

[ -f $HOME/.linuxbrew/etc/profile.d/autojump.sh ] && . $HOME/.linuxbrew/etc/profile.d/autojump.sh

export _ANTIGEN_CACHE_ENABLED=true

POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k

antigen use oh-my-zsh

antigen init $HOME/.antigenrc

antigen apply
