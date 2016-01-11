#!/bin/bash

GHC="ghc";
FILENAME=$1
NAME=${FILENAME%.*}
EXT=${FILENAME#*.}

#https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html
ARR=(${FILENAME//\// })
if [ "${ARR[1]}" != "" ]; then
    echo "Invalid path."
    exit 1
fi

if [ "$EXT" != "hs" ]; then
    echo "Invalid file name [.hs]."
    exit 1
fi

if [ ! -f $FILENAME ]; then
    echo "Not exist file."
    exit 1
fi

if [ "$1" != "" ]; then
    if [ "$1" = "maths.hs" ]; then
        $GHC -O2 --make $1 -threaded -rtsopts -o "dest/$NAME"
    else
        $GHC --make $1 -o "dest/$NAME"
    fi
    rm -f "$NAME.hi"
    rm -f "$NAME.o"
else
    $GHC --make test.hs -o dest/test
    rm -f "test.hi"
    rm -f "test.o"
fi

