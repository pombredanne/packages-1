#!/usr/bin/env bash

_auto_pack()
{
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -W "$(cat ~/packages/data/all_gogo_projects)" -- $cur) )
}

_make_go_project()
{
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -W "$(cat ~/packages/data/all_gogo_projects | while read s; do echo install_$s; done)" -- $cur) )
}

complete -F _auto_pack uto_pack
complete -F _make_go_project make
