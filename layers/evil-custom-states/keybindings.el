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
(dolist
    (p
     '(
       ("C-<tab>" . evil-motion-state)

       ("`" . evil-use-register)
       ("-" . evil-goto-line)
       ("=" . evil-goto-column)

       ("i" . evil-previous-line)
       ("j" . evil-backward-char)
       ("k" . evil-next-line)
       ("l" . evil-forward-char)
       ("u" . evil-backward-word-begin)
       ("o" . evil-forward-word-end)
       ("U" . evil-backward-WORD-end)
       ("O" . evil-forward-WORD-begin)

       ("h" . evil-first-non-blank)
       (";" . evil-end-of-line)

       ("m" . evil-custom-states/backward-left-bracket)
       ("," . evil-jump-item)
       ("." . evil-custom-states/forward-right-bracket)

       ("H-i" . evil-scroll-page-up)
       ("C-j" . evil-scroll-up)
       ("C-k" . evil-scroll-page-down)
       ("C-l" . evil-scroll-down)
       ("C-u" . evil-scroll-line-up)
       ("C-o" . evil-scroll-line-down)

       ("M-i" . evil-window-up)
       ("M-j" . evil-window-left)
       ("M-k" . evil-window-down)
       ("M-l" . evil-window-right)
       ("M-u" . evil-window-prev)
       ("M-o" . evil-window-next)

       ("I" . evil-ex-search-backward)
       ("J" . evil-ex-search-previous)
       ("K" . evil-ex-search-forward)
       ("L" . evil-ex-search-next)

       ("c" . evil-visual-char)
       ("C" . evil-visual-line)
       ("C-c" . evil-visual-block)
       ("M-c" . mark-whole-buffer)

       ("p" . evil-goto-mark)
       ("P" . evil-set-marker)

       ("y" . evil-execute-macro)
       ("Y" . evil-record-macro)

       ("n"   . evil-window-middle)
       ("N"   . evil-window-top)
       ("C-n" . evil-window-bottom)

       ("q" . quit-window)
       ("C-m" . evil-ret)

       (":" . evil-ex)
       ("\\" . hs-toggle-hiding)
       ("/" . evil-repeat)
       ))
  (keymap-set evil-visual-state-map (car p) (cdr p))
  (keymap-set evil-custom-motion-state-map (car p) (cdr p)))
(keymap-set evil-motion-state-map "C-<tab>" 'evil-custom-motion-state)

(evil-custom-add-ijkl-bindings Buffer-menu-mode-map 'custom-motion)
(evil-custom-add-ijkl-bindings dictionary-mode-map 'custom-motion)
(evil-custom-add-ijkl-bindings ert-results-mode-map 'custom-normal)
(evil-custom-add-ijkl-bindings ag-mode-map 'custom-motion)
(evil-custom-add-ijkl-bindings Info-mode-map '(custom-motion custom-normal)
  "C-<return>" 'Info-follow-nearest-node)
(evil-custom-add-ijkl-bindings speedbar-mode-map 'custom-motion
  "h" 'speedbar-item-info
  "i" 'speedbar-prev
  "j" 'backward-char
  "k" 'speedbar-next
  "l" 'forward-char)

(dolist
    (p
     '(
       ("C-<tab>" . evil-normal-state)
       ("<escape>" . evil-force-custom-normal-state)

       ("e" . evil-replace)
       ("s" . backward-delete-char)
       ("d" . evil-delete)
       ("f" . delete-char)
       ("w" . backward-kill-word)
       ("r" . kill-word)

       ("C-e" . raise-sexp)
       ("C-s" . evil-delete-back-to-indentation)
       ("C-d" . evil-join)
       ("C-f" . evil-delete-line)

       ("E" . evil-enter-replace-state)
       ("D" . evil-change)

       ("q" . evil-open-above)
       ("t" . evil-open-below)
       ("a" . evil-insert)
       ("g" . evil-append)

       ("Q" . evil-close-above)
       ("T" . evil-close-below)
       ("A" . evil-insert-once)
       ("G" . evil-append-once)

       ("z" . evil-undo)
       ("x" . evil-redo)
       ("v" . evil-paste-after)
       ("V" . evil-paste-before)
       ("b" . comment-dwim)

       ("C-<return>" . newline-and-indent)
       ))
  (keymap-set evil-visual-state-map (car p) (cdr p))
  (keymap-set evil-custom-normal-state-map (car p) (cdr p)))
(keymap-set evil-normal-state-map "C-<tab>" 'evil-custom-normal-state)

(dolist
    (p
     '(
       ("z" . evil-exit-visual-state)
       ("x" . evil-delete-char)
       ("X" . evil-delete-backward-char)
       ("c" . evil-yank)
       ("M-c" . evil-visual-char)
       ))
  (keymap-set evil-visual-state-map (car p) (cdr p)))

(dolist
    (p
     `(
       ("<escape>" . evil-custom-normal-state)
       ;; ("H-i" . evil-previous-line)
       ;; ("C-j" . evil-backward-char)
       ;; ("C-k" . evil-next-line)
       ;; ("C-l" . evil-forward-char)
       ;; ("C-u" . evil-backward-word-begin)
       ;; ("C-o" . evil-forward-word-end)
       ;; ("C-U" . evil-backward-WORD-end)
       ;; ("C-O" . evil-forward-WORD-begin)

       ;; ("C-h" . evil-first-non-blank)
       ;; ("C-;" . evil-end-of-line)

       ;; ("C-m" . evil-custom-states/backward-left-bracket)
       ;; ("C-," . evil-jump-item)
       ;; ("C-." . evil-custom-states/forward-right-bracket)

       ;; ("M-i" . evil-window-up)
       ;; ("M-j" . evil-window-left)
       ;; ("M-k" . evil-window-down)
       ;; ("M-l" . evil-window-right)
       ;; ("M-u" . evil-window-prev)
       ;; ("M-o" . evil-window-next)

       ;; ("C-e" . evil-replace)
       ;; ("C-s" . backward-delete-char)
       ;; ("C-d" . evil-delete)
       ;; ("C-f" . delete-char)
       ;; ("C-w" . backward-kill-word)
       ;; ("C-r" . kill-word)

       ;; ("C-q" . evil-open-above)
       ;; ("C-t" . evil-open-below)
       ;; ("C-a" . evil-custom-normal-state)

       ;; ("C-z" . comment-dwim)
       ;; ("C-x" . evil-undo)
       ;; ("C-c" . evil-redo)
       ;; ("C-v" . evil-paste-after)
       ;; ("C-V" . evil-paste-before)
       ))
  (dolist (evil-state-map
           (list evil-insert-state-map))
    (keymap-set evil-state-map (car p) (cdr p))))

(with-eval-after-load 'company
  (dolist (company-map
           (list company-active-map
                 company-search-map))
    (keymap-set company-map "C-j" 'company-select-previous)
    (keymap-set company-map "C-l" 'company-select-next)
    (keymap-set company-map "C-k" 'company-complete-selection)))

(with-eval-after-load 'helm
  (add-hook 'spacemacs-editing-style-hook 'spacemacs//helm-ijkl-navigation)
  (spacemacs//helm-ijkl-navigation dotspacemacs-editing-style))

(with-eval-after-load 'ivy
  (add-hook 'spacemacs-editing-style-hook 'spacemacs//ivy-ijkl-navigation)
  (spacemacs//ivy-ijkl-navigation dotspacemacs-editing-style))

(with-eval-after-load 'ido
  (keymap-set ido-common-completion-map "C-h" 'nil)
  (keymap-set ido-common-completion-map "C-i" 'ido-delete-backward-updir)
  (keymap-set ido-common-completion-map "C-j" 'ido-prev-match)
  (keymap-set ido-common-completion-map "C-k" 'ido-exit-minibuffer)
  (keymap-set ido-common-completion-map "C-l" 'ido-next-match)
  (keymap-set ido-common-completion-map "C-S-h" 'nil)
  (keymap-set ido-common-completion-map "C-S-i" 'previous-history-element)
  (keymap-set ido-common-completion-map "C-S-j" 'ido-prev-match-dir)
  (keymap-set ido-common-completion-map "C-S-k" 'next-history-element)
  (keymap-set ido-common-completion-map "C-S-l" 'ido-next-match-dir))

(with-eval-after-load 'paredit
  (keymap-set paredit-mode-map "C-d" nil)
  (keymap-set paredit-mode-map "C-k" nil)
  (keymap-set paredit-mode-map "M-k" nil)
  (evil-define-key '(emacs hybrid insert) paredit-mode-map
    (kbd "C-d") 'paredit-delete-char
    (kbd "C-k") 'paredit-kill
    (kbd "M-k") 'paredit-forward-kill-word)

  (evil-define-key 'custom-normal enhanced-evil-paredit-mode-map
    (kbd "P") nil
    (kbd "p") nil
    (kbd "c") nil
    (kbd "y") nil
    (kbd "D") nil
    (kbd "C") nil
    (kbd "S") nil
    (kbd "Y") nil
    (kbd "X") nil
    (kbd "x") nil
    (kbd "b") 'paredit-comment-dwim
    (kbd "v") 'enhanced-evil-paredit-paste-after
    (kbd "V") 'enhanced-evil-paredit-paste-before
    (kbd "d") 'enhanced-evil-paredit-delete
    (kbd "D") 'enhanced-evil-paredit-change
    (kbd "C-e") 'paredit-raise-sexp
    (kbd "C-f") 'enhanced-evil-paredit-delete-line)

  (evil-define-key 'visual enhanced-evil-paredit-mode-map
    (kbd "x") 'evil-delete-char
    (kbd "X") 'evil-delete-backward-char
    (kbd "c") 'enhanced-evil-paredit-yank
    (kbd "C") 'enhanced-evil-paredit-yank-line))
