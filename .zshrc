source $BREW_PREFIX/share/antigen/antigen.zsh

setopt HIST_IGNORE_SPACE

export _ANTIGEN_CACHE_ENABLED=true

POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k

antigen use oh-my-zsh

antigen init $HOME/.antigenrc

antigen apply

alias ytdl='youtube-dl --external-downloader aria2c --external-downloader-args "-c -j 5 -x 3 -s 3 -k 1M"'
