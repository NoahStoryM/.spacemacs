;; -*- mode: emacs-lisp; lexical-binding: t -*-
;;; keybindings.el --- own layer keybindings file for Spacemacs.
;;
;; Copyright (c) 2012-2025 Sylvain Benner & Contributors
;;
;; Author: noah <noah@NoahStoryM>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.

;;; Code:

(progn ;; Basic
  (keymap-set key-translation-map "C-SPC" "<escape>")
  (keymap-set key-translation-map "C-(" "<escape>")
  (custom-set-variables
   '(evil-default-state 'custom-normal)
   '(evil-want-C-i-jump nil)
   '(evil-want-C-u-scroll nil)
   '(evil-want-C-d-scroll nil))
  (keymap-set evil-insert-state-map "C-n" nil)
  (keymap-set evil-insert-state-map "C-p" nil)
  (keymap-set evil-insert-state-map "C-Y" nil)
  (keymap-set evil-insert-state-map "C-d" nil)
  (keymap-set evil-ex-completion-map "C-b" nil)
  (keymap-set evil-ex-completion-map "C-f" nil)
  (keymap-set evil-ex-completion-map "C-d" nil)
  (keymap-set evil-ex-search-keymap "C-f" nil)
  (keymap-set evil-normal-state-map "C-<return>" 'newline-and-indent)
  (keymap-set evil-normal-state-map "DEL" 'evil-delete-backward-char)
  (keymap-global-set "C-S-d" 'delete-backward-char)
  (keymap-global-set "C-S-a" 'mwim-end-of-code-or-line)
  (keymap-global-set "C-S-x" 'kill-region)
  (keymap-global-set "C-S-c" 'kill-ring-save)
  (keymap-global-set "C-S-v" 'yank)
  (keymap-global-set "M-S-v" 'yank-pop)
  (keymap-global-set "M-f" 'forward-word)
  (keymap-global-set "M-b" 'backward-word)
  (keymap-global-set "M-d" 'kill-word)
  (spacemacs/set-leader-keys "M-m" 'spacemacs/smex)
  (spacemacs/set-leader-keys "b c" 'kill-buffer))

(progn ;; EXWM
  (keymap-global-set "C-q" 'exwm-input-release-keyboard)
  (push ?\C-\\ exwm-input-prefix-keys))

(progn ;; Guix
  (spacemacs/set-leader-keys "g x" 'guix))

(progn ;; AI
  (spacemacs/set-leader-keys "a a" 'aidermacs-transient-menu))

(progn ;; Org
  (with-eval-after-load 'evil-org
    (evil-define-key '(visual) 'evil-org-mode
      (kbd "i e") nil
      (kbd "i E") nil
      (kbd "i r") nil
      (kbd "i R") nil
      (kbd "i")   'evil-previous-line
      (kbd "h e") 'evil-org-inner-object
      (kbd "h E") 'evil-org-inner-element
      (kbd "h r") 'evil-org-inner-greater-element
      (kbd "h R") 'evil-org-inner-subtree)))

(progn ;; Tab bar
  (dolist (i (number-sequence 1 9))
    (spacemacs/set-leader-keys (format "M-%d" i) 'tab-bar-select-tab))
  (spacemacs/set-leader-keys "M-0" 'tab-bar-select-tab-by-name)
  (spacemacs/set-leader-keys "M--" 'tab-bar-close-tab)
  (spacemacs/set-leader-keys "M-=" 'tab-bar-new-tab)
  (custom-set-variables '(tab-bar-select-tab-modifiers '(super)))
  (keymap-global-set "s-0" 'tab-bar-select-tab-by-name)
  (keymap-global-set "s--" 'tab-bar-close-tab)
  (keymap-global-set "s-=" 'tab-bar-new-tab))

(progn ;; Theme
  (spacemacs/set-leader-keys "T s" 'own/helm-themes))

(progn ;; Input method
  (keymap-global-set "C-S-SPC" 'toggle-input-method)
  ;; (spacemacs/set-leader-keys "\\" 'scratch-buffer)
  (with-eval-after-load 'pyim
    (pyim-scheme-add
     '(guobiao-shuangpin
       :document "国标双拼方案"
       :class shuangpin
       :first-chars "abcdefghijklmnopqrstuvwxyz"
       :rest-chars  "abcdefghijklmnopqrstuvwxyz"
       :prefer-triggers nil
       :cregexp-support-p t
       :keymaps
       (("a" "a" "a")
        ("b" "b" "ei")
        ("c" "c" "ao")
        ("d" "d" "ian")
        ("e" "e" "e")
        ("f" "f" "an")
        ("g" "g" "ang")
        ("h" "h" "eng")
        ("i" "ch" "i")
        ("j" "j" "ing")
        ("k" "k" "ai")
        ("l" "l" "in" "er")
        ("m" "m" "iao")
        ("n" "n" "iang" "uang")
        ("o" "o" "o" "uo")
        ("p" "p" "ou")
        ("q" "q" "ia" "ua")
        ("r" "r" "en")
        ("s" "s" "iong" "ong")
        ("t" "t" "ie")
        ("u" "sh" "u")
        ("v" "zh" "v" "ui")
        ("w" "w" "van" "uan")
        ("x" "x" "ve" "ue")
        ("y" "y" "iu" "uai")
        ("z" "z" "vn" "un")
        ("aa" "a")
        ("ak" "ai")
        ("af" "an")
        ("ag" "ang")
        ("ac" "ao")
        ("ae" "e")
        ("ab" "ei")
        ("ar" "en")
        ("ah" "eng")
        ("al" "er")
        ("ao" "o")
        ("ap" "ou"))))
    (pyim-default-scheme 'guobiao-shuangpin)))

(progn ;; YASnippet
  (keymap-global-set "C-l" 'company-yasnippet))
