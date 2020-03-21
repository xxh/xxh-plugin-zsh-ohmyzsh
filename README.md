[Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh/) plugin for [xxh-shell-zsh](github.com/xxh/xxh-shell-zsh).

## Install
Install from xxh repo:
```
xxh +I xxh-plugin-zsh-ohmyzsh
```
Install from any repo:
```
cd ~/.xxh/xxh/plugins \
    && git clone --depth 1 https://github.com/xxh/xxh-plugin-zsh-ohmyzsh \
    && ./xxh-plugin-zsh-ohmyzsh/build.sh
```
Connect manually:
``` 
xxh yourhost +s zsh +if
```

## Seamless mode
To use seamless mode with saving your theme and plugins use `source` command: 
```
source xxh.zsh myhost
```

## Environment variables

Xxh support environment variables: `xxh myhost +e NAME=VAL` or `~/.xxh/.xxhc` config.

* `+e ZSH_THEME=clean` - set theme
* `+e plugins="(git ubuntu)"` - set plugins list
