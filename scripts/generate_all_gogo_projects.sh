find . -type f -name "CMakeLists.txt" -print0 | xargs -0 cat | grep "^project(.*)$" | sed -E "s/project\((.*)\)/\\1/" | sort
