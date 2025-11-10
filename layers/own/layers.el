;; -*- mode: emacs-lisp; lexical-binding: t -*-
;;; layers.el --- own layer layers file for Spacemacs.
;;
;; Copyright (c) 2012-2025 Sylvain Benner & Contributors
;;
;; Author: noah <noah@NoahStoryM>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.

;;; Code:

(configuration-layer/declare-layers
 '(
   ;; ----------------------------------------------------------------
   ;; Programming Languages
   ;; ----------------------------------------------------------------
   agda
   ;; clojure
   ;; common-lisp
   ;; coq
   ;; csharp
   (c-c++ :variables
          c-c++-default-mode-for-headers 'c++-mode)
   emacs-lisp
   emoji
   ;; go
   haskell
   ;; idris
   ;; java
   javascript
   latex
   lua
   ;; major-modes
   nixos
   ;; typescript
   ;; php
   prolog
   python
   racket
   ;; ruby
   rust
   (scheme :variables
           scheme-implementations '(chez guile))
   shell-scripts
   ;; sml
   ;; solidity
   ;; sql
   vimscript
   zig

   ;; ----------------------------------------------------------------
   ;; File formats
   ;; ----------------------------------------------------------------
   csv
   graphviz
   html
   json
   pdf
   yaml

   ;; ----------------------------------------------------------------
   ;; Others
   ;; ----------------------------------------------------------------
   (auto-completion :variables
                    auto-completion-enable-sort-by-usage t
                    auto-completion-enable-snippets-in-popup t)
   (better-defaults :variables
                    better-defaults-move-to-end-of-code-first t)
   ;; (colors :variables
   ;;         colors-enable-nyan-cat-progress-bar t)
   (chinese :variables
            chinese-enable-youdao-dict t)
   ;; eaf
   (exwm :variables
         exwm-enable-systray t
         exwm-terminal-command "kitty"
         exwm-xim-mode t
         desktop-environment-mode t)
   (git :variables
        git-magit-status-fullscreen t
        magit-push-always-verify nil
        magit-save-repository-buffers 'dontask
        magit-revert-buffers 'silent
        magit-refs-show-commit-count 'all
        magit-revision-show-gravatars nil)
   helm
   helpful
   (ibuffer :variables
            ibuffer-group-buffers-by 'projects)
   imenu-list
   ;; ivy
   (llm-client :variables
               llm-client-enable-gptel t
               gptel-default-mode 'org-mode
               llm-client-enable-ellama t)
   ;; lsp
   markdown
   (multiple-cursors :variables
                     multiple-cursors-backend 'mc)
   (org :variables
        org-want-todo-bindings t)
   (shell :variables
          shell-default-height 30
          shell-default-position 'bottom
          shell-default-shell 'eshell)
   semantic
   smex
   spell-checking
   syntax-checking
   (templates :variables
              templates-private-directory (file-name-concat dotspacemacs-directory "templates"))
   (treemacs :variables
             treemacs--width-is-locked nil
             treemacs-width 20)
   unicode-fonts
   version-control
   ;; ycmd

   ;; ----------------------------------------------------------------
   ;; Local
   ;; ----------------------------------------------------------------
   evil-custom-states
   )
 )
