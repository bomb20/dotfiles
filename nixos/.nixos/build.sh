#!/usr/bin/env bash
# File              : build.sh
# Author            : Vincent Truchseß <redtux@posteo.net>
# Date              : 13.02.2019
# Last Modified Date: 13.02.2019
# Last Modified By  : Vincent Truchseß <redtux@posteo.net>

DIR="$(pwd)"
cd "$HOME/.nixos"
export NIXOS_CONFIG="$(pwd)/configuration.nix"
sudo nixos-rebuild switch
cd "$DIR"
