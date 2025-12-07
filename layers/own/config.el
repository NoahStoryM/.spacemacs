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
  (custom-set-variables '(evil-default-state 'custom-normal))
  (delete-selection-mode t)
  (global-font-lock-mode t)
  (global-prettify-symbols-mode t))

(progn ;; Char width
  (set-char-table-range char-width-table '#x00D7 1)
  (set-char-table-range char-width-table '#x00F7 1)
  (set-char-table-range char-width-table '(#x0370 . #x03FF) 1)
  (set-char-table-range char-width-table '(#x2070 . #x209F) 1)
  (set-char-table-range char-width-table '(#x2190 . #x21FF) 1)
  (set-char-table-range char-width-table '(#x2200 . #x22FF) 1)
  (set-char-table-range char-width-table '#x25CB 1)
  (set-char-table-range char-width-table '#x25A1 1))

(progn ;; Electric pair
  (custom-set-variables
   '(electric-pair-delete-adjacent-pairs nil)
   '(electric-pair-inhibit-predicate 'electric-pair-conservative-inhibit))
  (electric-pair-mode t))

(progn ;; Dired
  (with-eval-after-load 'evil
    (evil-set-initial-state 'dired-mode 'normal)))

(let ;; Theme
    ((theme (when custom-enabled-themes (car custom-enabled-themes))))
  (when (or (eq theme 'spacemacs-dark) (eq theme 'spacemacs-light))
    (spacemacs-theme-custom-colors theme)
    (load-theme theme t)))

(progn ;; AI
  (custom-set-variables
   '(gptel-temperature 0.7)
   '(gptel-prompt-prefix-alist
     '((org-mode . "** user\n")
       (markdown-mode . "### ")
       (text-mode . "### ")))
   '(gptel-response-prefix-alist
     '((org-mode . "** assistant\n")
       (markdown-mode . "")
       (text-mode . ""))))
  (add-hook 'gptel-post-stream-hook 'gptel-auto-scroll))

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
  (add-hook 'spacemacs-indent-sensitive-modes 'snippet-mode)
  (add-hook 'scheme-mode-hook
            (lambda ()
              (put 'case-λ 'scheme-indent-function
                   (get 'case-lambda 'scheme-indent-function)))))

(progn ;; Input method
  (setenv "XMODIFIERS"        "@im=fcitx")
  (setenv "QT_IM_MODULE"      "fcitx")
  (setenv "CLUTTER_IM_MODULE" "fcitx")
  (setenv "GTK_IM_MODULE"     "fcitx")
  (setenv "LC_CTYPE" "zh_CN.UTF-8")
  (custom-set-variables
   '(pyim-page-length 9)
   '(pyim-page-style 'vertical)))

(progn ;; Org
  (custom-set-variables
   '(org-src-fontify-natively t)
   '(org-pretty-entities t))
  (add-hook 'org-mode-hook
            (lambda ()
              (setq-local truncate-lines nil))))

(progn ;; Paren
  (custom-set-variables '(show-paren-style 'expression)))

(progn ;; Tab bar
  (custom-set-variables '(tab-bar-tab-hints t))
  (tab-bar-mode t))

(progn ;; Treemacs
  (custom-set-variables '(treemacs-width 20)))
