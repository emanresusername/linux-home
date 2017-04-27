source $HOME/.linuxbrew/share/antigen/antigen.zsh

setopt HIST_IGNORE_SPACE

[ -f $HOME/.linuxbrew/etc/profile.d/autojump.sh ] && . $HOME/.linuxbrew/etc/profile.d/autojump.sh

export _ANTIGEN_CACHE_ENABLED=true

POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k

antigen use oh-my-zsh

antigen init $HOME/.antigenrc

antigen apply

if type pbcopy >/dev/null 2>&1; then
    # osx pbcopy already defined
elif type xclip >/dev/null 2>&1; then
    # linux with xclip installed
    alias pbcopy="xclip -in -selection clipboard"
elif type termux-clipboard-set >/dev/null 2>&1; then
    # android with termux-api installed
    alias pbcopy="termux-clipboard-set"
else
    echo no pbcopy 4u
fi

if type pbpaste >/dev/null 2>&1; then
    # osx pbpaste already defined
elif type xclip >/dev/null 2>&1; then
    # linux with xclip installed
    alias pbpaste="xclip -out -selection clipboard"
elif type termux-clipboard-get >/dev/null 2>&1; then
    # android with termux-api installed
    alias pbpaste="termux-clipboard-get"
else
    echo no pbpaste 4u
fi
