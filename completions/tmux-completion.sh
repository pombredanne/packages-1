#!/usr/bin/env bash

_tmux_list_active_sessions()
{
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -W "$(tml | awk -F: '{ print $1 }')" -- $cur) )
}


complete -F _tmux_list_active_sessions tma
complete -F _tmux_list_active_sessions tmk
