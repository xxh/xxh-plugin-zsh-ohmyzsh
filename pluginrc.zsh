CURR_DIR="$(cd "$(dirname "$0")" && pwd)"
plugin_name='xxh-plugin-zsh-ohmyzsh'

export ZSH="$CURR_DIR/ohmyzsh"

if [[ -v ZSH_THEME ]]; then
  if [[ $XXH_VERBOSE == '2' ]]; then
    echo $plugin_name: Found ZSH_THEME=$ZSH_THEME
  fi
else
  if [[ $XXH_VERBOSE == '2' ]]; then
    echo $plugin_name: Set default ZSH_THEME=agnoster
  fi
  export ZSH_THEME="agnoster"
fi

if [[ -v plugins_ ]]; then
  if [[ $XXH_VERBOSE == '2' ]]; then
    echo $plugin_name: Found plugins=$plugins_
    eval "export plugins=$plugins_"
  fi
else
  if [[ $XXH_VERBOSE == '2' ]]; then
    echo $plugin_name: Set default plugins=git
  fi
  export plugins=(git)
fi

export DISABLE_AUTO_UPDATE=true
source $CURR_DIR/ohmyzsh/oh-my-zsh.sh
autoload -U compinit && compinit
