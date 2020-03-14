#!/usr/bin/env xonsh

import sys, argparse

parser = argparse.ArgumentParser(description='build')
parser.add_argument('-q', '--quiet', action='store_true', help=f"Quiet mode")
opt = parser.parse_args()

arg_q = ['-q'] if opt.quiet else []

plugin_path = pf"{__file__}".absolute().parent
plugin_build_path = plugin_path / 'build'

mkdir -p @(plugin_build_path)

pluginrc_file = plugin_path/'pluginrc.zsh'
if pluginrc_file.exists():
    cp @(pluginrc_file) @(plugin_build_path)

ohmyzsh_home = plugin_build_path / 'ohmyzsh'
if not ohmyzsh_home.exists():
    print('Git clone')
    git clone @(arg_q) --depth 1 https://github.com/robbyrussell/oh-my-zsh.git @(ohmyzsh_home)
