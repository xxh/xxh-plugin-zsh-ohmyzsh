CURR_DIR="$(cd "$(dirname "$0")" && pwd)"

export ZSH="$CURR_DIR/ohmyzsh"

if [ $ZSH_THEME ]; then
  if [[ $XXH_VERBOSE == '2' ]]; then
    echo Found ZSH_THEME=$ZSH_THEME
  fi
  if [[ $ZSH_THEME == *"("* ]]; then
    echo "Something went wrong while running zsh on host:"
    echo $check_result
  else
    echo $check_result > .entrypoint-check-done
  fi

elif [ $XXH_ZSH_PLUGIN_OHMYZSH_ZSH_THEME ]; then
  export ZSH_THEME="$XXH_ZSH_PLUGIN_OHMYZSH_ZSH_THEME"
else
  export ZSH_THEME="agnoster"
fi

if [ $plugins ]; then
  if [[ $XXH_VERBOSE == '2' ]]; then
    echo Found plugins=$plugins
  fi
  if [[ $plugins == *"("* ]]; then
    p=`echo -n $plugins | sed 's/\(^(\|)$\)//g'`
    IFS=' ' read -r -A plugins <<< "$p"
    export plugins
  fi
elif [ $XXH_ZSH_PLUGIN_OHMYZSH_PLUGINS ]; then
  p=`echo -n $XXH_ZSH_PLUGIN_OHMYZSH_PLUGINS | sed 's/\(^(\|)$\)//g'`
  IFS=' ' read -r -A plugins <<< "$p"
  export plugins
else
  export plugins=(git)
fi

export DISABLE_AUTO_UPDATE=true
source $CURR_DIR/ohmyzsh/oh-my-zsh.sh