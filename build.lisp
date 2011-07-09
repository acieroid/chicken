(require :parenscript)
(require :cl-ppcre)

(defpackage :build
  (:use :cl :ps :cl-ppcre)
  (:export #:build))
(in-package :build)


(defvar *sources* '("chicken.parenscript"))
(defvar *target* "release")

(setf *read-eval* nil)

(defun build-file (source target)
  (with-open-file (stream target :direction :output :if-exists :supersede)
    (format stream "~a" (ps-compile-file source))))

(defun build ()
  (mapcar (lambda (source)
            (let ((target-file (regex-replace ".parenscript$" source ".js")))
              (build-file source 
                          (concatenate 'string *target* "/" target-file))))
          *sources*))