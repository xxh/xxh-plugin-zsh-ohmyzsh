CURR_DIR="$(cd "$(dirname "$0")" && pwd)"

export ZSH="$CURR_DIR/ohmyzsh"

if [ $XXH_ZSH_PLUGIN_OHMYZSH_ZSH_THEME ]; then
  export ZSH_THEME="$XXH_ZSH_PLUGIN_OHMYZSH_ZSH_THEME"
else
  export ZSH_THEME="agnoster"
fi

if [ $XXH_ZSH_PLUGIN_OHMYZSH_PLUGINS ]; then
  p=`echo -n $XXH_ZSH_PLUGIN_OHMYZSH_PLUGINS | sed 's/\(^(\|)$\)//g'`
  IFS=' ' read -r -A plugins <<< "$p"
  export plugins
else
  export plugins=(git)
fi

export DISABLE_AUTO_UPDATE=true
source $CURR_DIR/ohmyzsh/oh-my-zsh.sh