#!/bin/sh

sbcl --load build.lisp --eval '(build:build)' --eval '(sb-ext:quit)'
