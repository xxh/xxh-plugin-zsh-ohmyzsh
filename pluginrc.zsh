plugin_env_name='XXH_PLUGIN_ZSH_OHMYZSH'
CURR_DIR="$(cd "$(dirname "$0")" && pwd)"

export ZSH="$CURR_DIR/ohmyzsh"

# Search EXE environment variables for plugin and execute
prefix="$plugin_env_name"_EXE_
for l in `env | grep $prefix`; do
  if [[ $XXH_VERBOSE == '2' ]]; then
    echo $plugin_env_name: found $l
  fi
  data="$( cut -d '=' -f 2- <<< "$l" )";
  code=`echo $data | base64 -d`
  if [[ $XXH_VERBOSE == '2' ]]; then
    echo Run: $code
  fi
  eval $code
done

if [[ -v ZSH_THEME ]]; then
  if [[ $XXH_VERBOSE == '2' ]]; then
    echo Found ZSH_THEME=$ZSH_THEME
  fi
else
  if [[ $XXH_VERBOSE == '2' ]]; then
    echo Set default ZSH_THEME=agnoster
  fi
  export ZSH_THEME="agnoster"
fi

if [[ -v plugins ]]; then
  if [[ $XXH_VERBOSE == '2' ]]; then
    echo Found plugins=$plugins
  fi
else
  if [[ $XXH_VERBOSE == '2' ]]; then
    echo Set default plugins=git
  fi
  export plugins=(git)
fi

export DISABLE_AUTO_UPDATE=true
source $CURR_DIR/ohmyzsh/oh-my-zsh.sh
