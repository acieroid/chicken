#!/bin/sh

sbcl --load build.lisp --eval '(build:build)' --eval '(sb-ext:quit)'

emacs --batch --visit howto.org --funcall org-export-as-html-batch
if [ -f howto.html ]
then
  mv howto.html release/
fi
