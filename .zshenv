export BREW_PREFIX=`brew --prefix`
export PATH="$BREW_PREFIX/sbin:$BREW_PREFIX/bin:$PATH"
export MANPATH="$BREW_PREFIX/share/man:$MANPATH"
export INFOPATH="$BREW_PREFIX/share/info:$INFOPATH"
export XDG_DATA_DIRS="$BREW_PREFIX/share:$XDG_DATA_DIRS"
