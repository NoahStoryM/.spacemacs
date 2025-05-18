;; -*- mode: emacs-lisp; lexical-binding: t -*-
;;; funcs.el --- own layer funcs file for Spacemacs.
;;
;; Copyright (c) 2012-2025 Sylvain Benner & Contributors
;;
;; Author: noah <noah@NoahStoryM>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.

;;; Code:

;; Theme
(defun spacemacs-theme-custom-colors (theme)
  (setopt
   spacemacs-theme-custom-colors
   `(
     ;;                                                                  ~~ Dark ~~                              ~~ Light ~~
     ;;                                                                     GUI       TER                           GUI       TER
     ;; generic
     (base          . ,(if (eq theme 'spacemacs-dark) (if (true-color-p) "#bbc2cf" "#bbc2cf") (if (true-color-p) "#000000" "#000000")))
     (bg1           . ,(if (eq theme 'spacemacs-dark) (if (true-color-p) "#282a36" "#29282e") (if (true-color-p) "#fdf7e3" "#ffffff")))
     (bg2           . ,(if (eq theme 'spacemacs-dark) (if (true-color-p) "#23212a" "#1c1c1c") (if (true-color-p) "#eeede8" "#e4e4e4")))
     (cblk-bg       . ,(if (eq theme 'spacemacs-dark) (if (true-color-p) "#2f2b33" "#262626") (if (true-color-p) "#fbf8ef" "#ffffff")))
     (func          . ,(if (eq theme 'spacemacs-dark) (if (true-color-p) "#bc6ec5" "#d75fd7") (if (true-color-p) "#705091" "#8700af")))
     (comment       . ,(if (eq theme 'spacemacs-dark) (if (true-color-p) "#2ca6b3" "#008787") (if (true-color-p) "#2aa1ae" "#008787")))
     (comment-light . ,(if (eq theme 'spacemacs-dark) (if (true-color-p) "#2ca6b3" "#008787") (if (true-color-p) "#a49da5" "#008787")))
     (comment-bg    . ,(if (eq theme 'spacemacs-dark) (if (true-color-p) "#262c36" "#262626") (if (true-color-p) "#fdf3dc" "#ffffff")))
     )))

(defun own/helm-themes ()
  "Customize colors If switching to `spacemacs-themes'"
  (interactive)
  (spacemacs/helm-themes)
  (let ((theme (when custom-enabled-themes (car custom-enabled-themes))))
    (when (or (eq theme 'spacemacs-dark) (eq theme 'spacemacs-light))
      (spacemacs-theme-custom-colors theme)
      (let (helm-candidate-number-limit)
        (helm-themes--delete-theme)
        (load-theme theme t)))))
