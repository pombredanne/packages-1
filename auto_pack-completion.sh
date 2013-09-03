#!/usr/bin/env bash

_auto_pack()
{
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -W "$(cat ~/packages/data/all_gogo_projects)" -- $cur) )
}

complete -F _auto_pack uto_pack
complete -F _auto_pack make
