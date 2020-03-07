#!/usr/bin/env xonsh

plugin_path = pf"{__file__}".absolute().parent
plugin_build_path = plugin_path / 'build'

ohmyzsh_home = plugin_build_path / 'ohmyzsh'
if not ohmyzsh_home.exists():
    print('Git clone')
    git clone --depth 1 https://github.com/robbyrussell/oh-my-zsh.git @(ohmyzsh_home)