#!/bin/bash

ghc --make test.hs -o dest/test
rm -f test.hi
rm -f test.o
