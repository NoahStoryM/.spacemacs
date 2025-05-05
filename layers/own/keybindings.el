;;; keybindings.el --- own layer keybindings file for Spacemacs.
;;
;; Copyright (c) 2012-2025 Sylvain Benner & Contributors
;;
;; Author: noah <noah@NoahStoryM>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.

;;; Code:

(keyboard-translate ?\( ?\[)
(keyboard-translate ?\[ ?\()
(keyboard-translate ?\) ?\])
(keyboard-translate ?\] ?\))

(define-key evil-emacs-state-map (kbd "<C-tab>") 'evil-normal-state)
(define-key evil-hybrid-state-map (kbd "<C-tab>") 'evil-normal-state)
(define-key evil-insert-state-map (kbd "<C-tab>") 'evil-normal-state)

(define-key evil-hybrid-state-map (kbd "C-n") 'nil)
(define-key evil-hybrid-state-map (kbd "C-p") 'nil)
(define-key evil-ex-completion-map (kbd "C-b") 'nil)
(define-key evil-ex-completion-map (kbd "C-f") 'nil)
(define-key evil-ex-search-keymap (kbd "C-f") 'nil)
