;; -*- mode: emacs-lisp; lexical-binding: t -*-
;;; keybindings.el --- evil-custom-states layer keybindings file for Spacemacs.
;;
;; Copyright (c) 2012-2025 Sylvain Benner & Contributors
;;
;; Author: noah <noah@NoahStoryM>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.

;;; Code:

(keymap-set input-decode-map "C-i" "H-i")
(dotimes (i 10)
  (keymap-set evil-custom-motion-state-map (format "%d" i) 'digit-argument))
(dolist
    (p
     '(
       ("`" . evil-use-register)

       ("i" . evil-previous-line)
       ("j" . evil-backward-char)
       ("k" . evil-next-line)
       ("l" . evil-forward-char)
       ("u" . evil-backward-word-begin)
       ("o" . evil-forward-word-end)
       ("U" . evil-backward-WORD-end)
       ("O" . evil-forward-WORD-begin)

       ("H-i" . evil-scroll-up)
       ("C-j" . evil-scroll-page-up)
       ("C-k" . evil-scroll-down)
       ("C-l" . evil-scroll-page-down)
       ("C-u" . evil-scroll-line-up)
       ("C-o" . evil-scroll-line-down)

       ("M-i" . evil-window-up)
       ("M-j" . evil-window-left)
       ("M-k" . evil-window-down)
       ("M-l" . evil-window-right)
       ("M-u" . evil-window-prev)
       ("M-o" . evil-window-next)

       ("I" . evil-ex-search-previous)
       ("J" . evil-ex-search-backward)
       ("K" . evil-ex-search-next)
       ("L" . evil-ex-search-forward)

       ("b" . evil-visual-char)
       ("B" . evil-visual-line)
       ("C-b" . evil-visual-block)

       ("h" . evil-first-non-blank)
       (";" . evil-end-of-line)

       ("m" . own/backward-left-bracket)
       ("," . evil-jump-item)
       ("." . own/forward-right-bracket)

       ("p" . evil-goto-mark)
       ("P" . evil-set-marker)

       ("y" . evil-execute-macro)
       ("Y" . evil-record-macro)

       ("n" . evil-window-middle)

       (":" . evil-ex)
       ("\\" . hs-toggle-hidin)
       ("/" . evil-repeat)
       ))
  (keymap-set evil-visual-state-map (car p) (cdr p))
  (keymap-set evil-custom-motion-state-map (car p) (cdr p)))

(evil-add-ijkl-bindings Buffer-menu-mode-map 'custom-motion)
(evil-add-ijkl-bindings dictionary-mode-map 'custom-motion)
(evil-add-ijkl-bindings Info-mode-map 'custom-normal)
(evil-add-ijkl-bindings ert-results-mode-map 'custom-normal)
(evil-add-ijkl-bindings ag-mode-map 'custom-motion)
(evil-add-ijkl-bindings speedbar-mode-map 'custom-motion
  "h" 'speedbar-item-info
  "i" 'speedbar-prev
  "j" 'backward-char
  "k" 'speedbar-next
  "l" 'forward-char)

(dolist
    (p
     '(
       ("<escape>" . evil-force-custom-normal-state)

       ("e" . evil-change)
       ("s" . backward-delete-char)
       ("d" . evil-delete)
       ("f" . delete-char)
       ("w" . backward-kill-word)
       ("r" . kill-word)

       ("E" . evil-change-line)
       ("D" . evil-delete-line)

       ("a" . evil-insert)
       ("g" . evil-append)
       ("q" . evil-open-below)
       ("t" . evil-replace)

       ("A" . evil-insert-line)
       ("G" . evil-append-line)
       ("Q" . evil-open-above)
       ("T" . evil-enter-replace-state)

       ("z" . comment-dwim)
       ("x" . evil-undo)
       ("c" . evil-redo)
       ("v" . evil-paste-after)
       ("V" . evil-paste-before)

       ("Z" . evil-join)
       ))
  (keymap-set evil-visual-state-map (car p) (cdr p))
  (keymap-set evil-custom-normal-state-map (car p) (cdr p)))

(dolist
    (p
     `(
       ("s" . evil-surround-region)

       ("b" . evil-exit-visual-state)
       ("x" . evil-delete-char)
       ("X" . evil-delete-backward-char)
       ("c" . evil-yank)
       ("C" . evil-yank-line)
       ))
  (keymap-set evil-visual-state-map (car p) (cdr p)))

(dolist (evil-state-map
         (list evil-emacs-state-map
               evil-replace-state-map
               evil-hybrid-state-map
               evil-insert-state-map))
  (keymap-set evil-state-map "<escape>" 'evil-custom-normal-state))
