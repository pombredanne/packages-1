#!/usr/bin/env bash

# eclipse-plugins.p2f
# import manually File -> Import -> Install -> Install software from files

# install "Dark Juno" theme from here
# http://rogerdudler.github.io/eclipse-ui-themes/

# java-codestyle-formatter-go.mail.ru.xml
# features:
# indentation size = 4, use only spaces
# Preferences -> Java -> Code Style -> Formatter -> Import

# EPF
# used by "eclipse workspace mechanics" eclipse plugin

# eclipse-keybindings.epf (can be created manually File -> Export -> General -> Preferences)
# ... other ...
for f in $(ls *.epf); do 
    ln -sf $(pwd)/$f ~/.eclipse/mechanic/$f
done
