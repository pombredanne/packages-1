#!/usr/bin/env bash
ports=$(ssh d "lsof -i | grep 10061 | grep LISTEN" | grep -o ":[[:digit:]]\+" | cut -d : -f 2)
for p in $ports; do
    ssh -f -N -L $p:127.0.0.1:$p o.ryabukhin@d &> /dev/null
done
