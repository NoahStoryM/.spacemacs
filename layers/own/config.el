;; -*- mode: emacs-lisp; lexical-binding: t -*-
;;; config.el --- own layer config file for Spacemacs.
;;
;; Copyright (c) 2012-2025 Sylvain Benner & Contributors
;;
;; Author: noah <noah@NoahStoryM>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.

;;; Code:

(progn ;; Basic
  (delete-selection-mode t)
  (global-font-lock-mode t)
  (global-prettify-symbols-mode t))

(progn ;; Electric pair
  (electric-pair-mode t)
  (custom-set-variables
   '(electric-pair-delete-adjacent-pairs nil)
   '(electric-pair-inhibit-predicate 'electric-pair-conservative-inhibit)))

(let ;; Theme
    ((theme (when custom-enabled-themes (car custom-enabled-themes))))
  (when (or (eq theme 'spacemacs-dark) (eq theme 'spacemacs-light))
    (spacemacs-theme-custom-colors theme)
    (load-theme theme t)))

(progn ;; Indent
  (custom-set-variables
   '(c-basic-offset 4)
   '(c-default-style
     '((java-mode . "java")
       (awk-mode . "awk")
       (other . "ellemtel")))
   '(default-tab-width 4)
   ;; '(nasm-basic-offset 4))
   ;; '(octave-block-offset 4))
   '(indent-tabs-mode nil)
   '(comment-style 'multi-line))
  (add-hook 'spacemacs-indent-sensitive-modes 'snippet-mode))

(progn ;; Input method
  (setenv "XMODIFIERS"        "@im=fcitx")
  (setenv "QT_IM_MODULE"      "fcitx")
  (setenv "CLUTTER_IM_MODULE" "fcitx")
  (setenv "GTK_IM_MODULE"     "fcitx")
  (setenv "LC_CTYPE" "zh_CN.UTF-8")
  (custom-set-variables
   '(pyim-page-length 9)
   '(pyim-page-style 'vertical)))

(progn ;; Paren
  (custom-set-variables '(show-paren-style 'expression)))

(progn ;; Tab bar
  (tab-bar-mode t)
  (custom-set-variables '(tab-bar-tab-hints t)))

(progn ;; Treemacs
  (custom-set-variables '(treemacs-width 20)))
