#!/usr/bin/env python
import sys
import sets
import re

dirs = sets.Set()

lines = sys.stdin.readlines()
i = 0
while i < len(lines):
    block = []
    if lines[i].find("include_directories") >= 0:
        while True:
            block.append(lines[i])
            if lines[i].find(")") >= 0:
                break
            i += 1
    for el_of_block in block:
        toks = re.split(' |\(|\)', el_of_block)
        for token in toks:
            if token.find("GOGO_ROOT") >= 0:
                dirs.add(token.replace("\"", "").strip())
    i += 1

for d in dirs:
    print d



