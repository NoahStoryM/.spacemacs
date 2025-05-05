;;; config.el --- own layer config file for Spacemacs.
;;
;; Copyright (c) 2012-2025 Sylvain Benner & Contributors
;;
;; Author: noah <noah@NoahStoryM>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.

;;; Code:

(setq-default c-basic-offset 4)
(setq-default c-default-style "ellemtel")
(setq-default default-tab-width 4)
;; (setq-default nasm-basic-offset 4)
;; (setq-default octave-block-offset 4)
(setq-default indent-tabs-mode nil)
(setq-default comment-style 'multi-line)

(menu-bar-mode t)
(electric-pair-mode t)
(delete-selection-mode t)
(global-font-lock-mode t)
(global-prettify-symbols-mode t)
(global-font-lock-mode t)
