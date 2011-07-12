#!/bin/sh

sbcl --load build.lisp --eval '(build:build)' --eval '(sb-ext:quit)'

emacs --batch --visit README.org --funcall org-export-as-html-batch
if [ -f README.html ]
then
  mv README.html release/
fi
