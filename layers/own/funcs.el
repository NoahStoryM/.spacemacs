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

;; Keymap
(defun keymap-clear (keymap prefixes)
  (dolist (prefix prefixes)
    (dolist (i '(
                 "1" "2" "3" "4" "5" "6" "7" "8" "9" "0" "-" "="
                 "q" "w" "e" "r" "t" "y" "u" "i" "o" "p" "[" "]" "\\"
                 "a" "s" "d" "f" "g" "h" "j" "k" "l" ";" "'"
                 "z" "x" "c" "v" "b" "n" "m" "," "." "/"

                 "!" "@" "#" "$" "%" "^" "&" "*" "(" ")" "_" "+"
                 "Q" "W" "E" "R" "T" "Y" "U" "I" "O" "P" "{" "}" "|"
                 "A" "S" "D" "F" "G" "H" "J" "K" "L" ":" "\""
                 "Z" "X" "C" "V" "B" "N" "M" "<" ">" "?"
                 ))
      (let ((key (format "%s%s" prefix i)))
        (keymap-set keymap key nil)))))

;; Evil
(defmacro evil-add-ijkl-bindings (keymap &optional state &rest bindings)
  "Add \"i\", \"j\", \"k\", \"l\" bindings to KEYMAP in STATE.
Add additional BINDINGS if specified."
  (declare (indent defun))
  `(evil-define-key ,state ,keymap
     "i" (lookup-key evil-motion-state-map "i")
     "j" (lookup-key evil-motion-state-map "j")
     "k" (lookup-key evil-motion-state-map "k")
     "l" (lookup-key evil-motion-state-map "l")
     ":" (lookup-key evil-motion-state-map ":")
     ,@bindings))

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

;; Brackets
(defvar own/brackets '("“”" "()" "[]" "{}" "<>" "＜＞" "（）" "［］" "｛｝" "⦅⦆" "〚〛" "⦃⦄" "‹›" "«»" "「」" "〈〉" "《》" "【】" "〔〕" "⦗⦘" "『』" "〖〗" "〘〙" "｢｣" "⟦⟧" "⟨⟩" "⟪⟫" "⟮⟯" "⟬⟭" "⌈⌉" "⌊⌋" "⦇⦈" "⦉⦊" "❛❜" "❝❞" "❨❩" "❪❫" "❴❵" "❬❭" "❮❯" "❰❱" "❲❳" "〈〉" "⦑⦒" "⧼⧽" "﹙﹚" "﹛﹜" "﹝﹞" "⁽⁾" "₍₎" "⦋⦌" "⦍⦎" "⦏⦐" "⁅⁆" "⸢⸣" "⸤⸥" "⟅⟆" "⦓⦔" "⦕⦖" "⸦⸧" "⸨⸩" "｟｠")
  "A list of strings, each element is a string of 2 chars, the left bracket and a matching right bracket.")

(defconst own/left-brackets
  (mapcar (lambda (x) (substring x 0 1)) own/brackets)
  "List of left bracket chars. Each element is a string.")

(defconst own/right-brackets
  (mapcar (lambda (x) (substring x 1 2)) own/brackets)
  "List of right bracket chars. Each element is a string.")

(defun own/backward-left-bracket (&optional count)
  "Move cursor to the previous occurrence of left bracket.
The list of brackets to jump to is defined by `own/left-brackets'."
  (interactive)
  (let ((regexp (regexp-opt own/left-brackets)))
    (re-search-backward regexp nil t count)))

(defun own/forward-right-bracket (&optional count)
  "Move cursor to the previous occurrence of right bracket.
The list of brackets to jump to is defined by `own/left-brackets'."
  (interactive)
  (let ((regexp (regexp-opt own/right-brackets)))
    (when (looking-at regexp) (right-char 1))
    (re-search-forward regexp nil t count)
    (left-char 1)))
