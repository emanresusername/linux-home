export ZPLUG_HOME=$HOME/.zplug
local zplug_init=$ZPLUG_HOME/init.zsh
if [ ! -f "$zplug_init" ] &> /dev/null; then
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
fi
source $zplug_init

zplug "plugins/thefuck", from:oh-my-zsh
zplug "plugins/zsh_reload", from:oh-my-zsh
zplug "plugins/emacs", from:oh-my-zsh
zplug "plugins/gitfast", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "emanresusername/zsh-plugins", use:electron-chrome
zplug "emanresusername/zsh-plugins", use:chrome-app
zplug "emanresusername/zsh-plugins", use:cowfiles
zplug "emanresusername/zsh-plugins", use:s3cmd
zplug "emanresusername/zsh-plugins", use:spacemacs, at:homeshick
zplug "emanresusername/zsh-plugins", use:homeshick, at:homeshick

zplug "marzocchi/zsh-notify", \
      use:"notify.plugin.zsh", \
      hook-build:"brew install wmctrl xdotool"
zstyle ':notify:*' command-complete-timeout 2

zplug "MichaelAquilina/zsh-emojis"

zplug "wting/autojump", use:"bin/autojump.zsh"

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

zplug "b4b4r07/enhancd", \
      use:init.sh, \
      on:"junegunn/fzf-bin"

zplug "lib/clipboard", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh

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
zplug "stedolan/jq", \
      from:gh-r, \
      as:command, \
      rename-to:jq

zplug "fcambus/ansiweather", \
      on:"stedolan/jq"

zplug "zpm-zsh/linuxbrew", \
      use:"linuxbrew.plugin.zsh"

POWERLEVEL9K_INSTALLATION_PATH=$ZPLUG_REPOS/bhilburn/powerlevel9k
zplug "bhilburn/powerlevel9k", \
      use:powerlevel9k.zsh-theme, \
      hook-build:"sudo apt install -y fonts-powerline"

# tmux
zplug "jreese/zsh-titles"
zplug "TBSliver/zsh-plugin-tmux-simple"

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

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

# https://stackoverflow.com/a/257666
alias sudo="sudo env PATH=$PATH"

PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;

. `brew --prefix`/opt/asdf/asdf.sh

for user repo in emanresusername .ammonite \
                                 emanresusername .sbt \
                 ; do
  homeshick-homeshwell-clone $user $repo $repo
done
homeshick clone git@github.com/emanresusername/linux-home.git
homeshick link
