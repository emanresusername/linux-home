local homeshick_home="$HOME/.homesick/repos/homeshick"
local homeshick_init="$homeshick_home/homeshick.sh"
if [ ! -f "$homeshick_init" ] &> /dev/null; then
  git clone git://github.com/andsens/homeshick.git $homeshick_home
fi
source $homeshick_init

function homeshick-first-run() {
  for repo in .ammonite \
                .sbt \
                linux-home \
              ; do
    (homeshick cd "$repo" 2>/dev/null) || homeshick clone "emanresusername/$repo"
  done
  homeshick link
}

export ZPLUG_HOME=$HOME/.zplug

export ZPLUG_LOADFILE="$HOME/.zplug.packages.zsh"
test -f "$ZPLUG_LOADFILE" || homeshick-first-run

local zplug_init=$ZPLUG_HOME/init.zsh
if [ ! -f "$zplug_init" ] &> /dev/null; then
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
fi
source $zplug_init

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    oldpwd=$ZPLUG_SUDO_PASSWORD
    printf "\nzplug sudo password? "
    read -s ZPLUG_SUDO_PASSWORD
    echo; zplug install
    export ZPLUG_SUDO_PASSWORD=$oldpwd
  fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

if [[ $OSTYPE == linux-android ]]; then
  export TERM="xterm-256color"
else
  if [[ $OSTYPE == linux* ]]; then
    # https://stackoverflow.com/a/257666
    alias sudo="sudo env PATH=$PATH"
  fi

  PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
  PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
  PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
  PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
  PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;

  . `brew --prefix`/opt/asdf/asdf.sh
fi
