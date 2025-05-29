;; -*- mode: emacs-lisp; lexical-binding: t -*-
;;; packages.el --- own layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2025 Sylvain Benner & Contributors
;;
;; Author: noah <noah@NoahStoryM>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `own-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `own/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `own/pre-init-PACKAGE' and/or
;;   `own/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst own-packages
  '(
    aidermacs
    enhanced-evil-paredit
    frameshot
    guix
    on-parens
    (pyim-tsinghua-dict :location
                        (recipe :fetcher github
                                :repo "redguardtoo/pyim-tsinghua-dict"))
    (scribble :location local)
    )
  "The list of Lisp packages required by the own layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun own/init-aidermacs ()
  (use-package aidermacs
    :defer t
    :custom
    (aidermacs-use-architect-mode t)
    (aidermacs-architect-model "deepseek/deepseek-reasoner")
    (aidermacs-editor-model "deepseek/deepseek-chat")
    (aidermacs-default-model "deepseek/deepseek-chat")
    (aidermacs-weak-model "deepseek/deepseek-chat")))

(defun own/init-enhanced-evil-paredit ()
  (use-package enhanced-evil-paredit
    :defer t
    :hook
    (paredit-mode     . enhanced-evil-paredit-mode)
    (clojure-mode     . paredit-mode)
    (common-lisp-mode . paredit-mode)
    (emacs-lisp-mode  . paredit-mode)
    (racket-mode      . paredit-mode)
    (racket-repl-mode . paredit-mode)
    (scheme-mode      . paredit-mode)))

(defun own/init-frameshot ()
  (use-package frameshot
    :defer t
    :custom
    (frameshot-mode t)))

(defun own/init-guix ()
  (use-package guix
    :defer t
    :hook
    (dired-mode  . guix-prettify-mode)
    (eshell-mode . guix-prettify-mode)
    (shell-mode  . guix-prettify-mode)
    (eshell-mode . guix-build-log-minor-mode)
    (shell-mode  . guix-build-log-minor-mode)
    (scheme-mode . guix-devel-mode)))

(defun own/init-on-parens ()
  (use-package on-parens
    :defer t))

(defun own/init-pyim-tsinghua-dict ()
  (use-package pyim-tsinghua-dict
    :defer t
    :config
    (pyim-tsinghua-dict-enable)))

(defun own/init-scribble ()
  (use-package scribble
    :defer t
    :init
    (require 'scribble)
    :hook
    (scribble-mode . (lambda () (setq-local comment-start "@;; ")))))
