;; -*- mode: emacs-lisp; lexical-binding: t -*-
;;; funcs.el --- evil-custom-states layer funcs file for Spacemacs.
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

;; Brackets
(defvar evil-custom-states/brackets '("\"\"" "“”" "()" "[]" "{}" "<>" "＜＞" "（）" "［］" "｛｝" "⦅⦆" "〚〛" "⦃⦄" "‹›" "«»" "「」" "〈〉" "《》" "【】" "〔〕" "⦗⦘" "『』" "〖〗" "〘〙" "｢｣" "⟦⟧" "⟨⟩" "⟪⟫" "⟮⟯" "⟬⟭" "⌈⌉" "⌊⌋" "⦇⦈" "⦉⦊" "❛❜" "❝❞" "❨❩" "❪❫" "❴❵" "❬❭" "❮❯" "❰❱" "❲❳" "〈〉" "⦑⦒" "⧼⧽" "﹙﹚" "﹛﹜" "﹝﹞" "⁽⁾" "₍₎" "⦋⦌" "⦍⦎" "⦏⦐" "⁅⁆" "⸢⸣" "⸤⸥" "⟅⟆" "⦓⦔" "⦕⦖" "⸦⸧" "⸨⸩" "｟｠")
  "A list of strings, each element is a string of 2 chars, the left bracket and a matching right bracket.")

(defconst evil-custom-states/left-brackets
  (mapcar (lambda (x) (substring x 0 1)) evil-custom-states/brackets)
  "List of left bracket chars. Each element is a string.")

(defconst evil-custom-states/right-brackets
  (mapcar (lambda (x) (substring x 1 2)) evil-custom-states/brackets)
  "List of right bracket chars. Each element is a string.")

(defun evil-custom-states/backward-left-bracket (&optional count)
  "Move cursor to the previous occurrence of left bracket.
The list of brackets to jump to is defined by `evil-custom-states/left-brackets'."
  (interactive)
  (let ((regexp (regexp-opt evil-custom-states/left-brackets)))
    (re-search-backward regexp nil t count)))

(defun evil-custom-states/forward-right-bracket (&optional count)
  "Move cursor to the previous occurrence of right bracket.
The list of brackets to jump to is defined by `evil-custom-states/left-brackets'."
  (interactive)
  (let ((regexp (regexp-opt evil-custom-states/right-brackets)))
    (when (looking-at regexp) (right-char 1))
    (re-search-forward regexp nil t count)
    (left-char 1)))
