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
(defun evil-close-above (count)
  "Insert a new line above point.
The insertion will be repeated COUNT times."
  (interactive "p")
  (evil-open-above count)
  (evil-custom-normal-state))

(defun evil-close-below (count)
  "Insert a new line below point.
The insertion will be repeated COUNT times."
  (interactive "p")
  (evil-open-below count)
  (evil-custom-normal-state))

(defun evil-insert-once ()
  "Insert characters."
  (interactive)
  (evil-insert-state)
  (unwind-protect (insert (read-char))
    (evil-custom-normal-state)))

(defun evil-append-once ()
  "Append characters."
  (interactive)
  (right-char 1)
  (evil-insert-once))

;; Evil custom
(defmacro evil-custom-add-ijkl-bindings (keymap &optional state &rest bindings)
  "Add \"i\", \"j\", \"k\", \"l\" bindings to KEYMAP in STATE.
Add additional BINDINGS if specified."
  (declare (indent defun))
  `(evil-define-key ,state ,keymap
     "i" (lookup-key evil-custom-motion-state-map "i")
     "j" (lookup-key evil-custom-motion-state-map "j")
     "k" (lookup-key evil-custom-motion-state-map "k")
     "l" (lookup-key evil-custom-motion-state-map "l")
     ":" (lookup-key evil-custom-motion-state-map ":")
     ,@bindings))

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

;; Spacemacs ijkl
(defcustom hybrid-style-enable-ijkl-bindings nil
  "If non-nil then packages configuration should enable ijkl navigation."
  :group 'spacemacs
  :type 'boolean)

(defun spacemacs//support-ijkl-navigation-p ()
  "Returns non-nil if navigation keys should be evilified."
  (or (eq dotspacemacs-editing-style 'vim)
      (and (eq dotspacemacs-editing-style 'hybrid)
           hybrid-style-enable-ijkl-bindings)))

(defun spacemacs//ivy-ijkl-navigation (style)
  "Set navigation on 'ijkl' for the given editing STYLE."
  (cond
   ((or (eq 'vim style)
        (and (eq 'hybrid style)
             hybrid-style-enable-ijkl-bindings))
    (define-key ivy-minibuffer-map (kbd "C-h") 'nil)
    (define-key ivy-minibuffer-map (kbd "C-S-h") help-map)
    (dolist (map (list ivy-minibuffer-map
                       ivy-switch-buffer-map
                       ivy-reverse-i-search-map))
      (define-key map (kbd "C-l") 'ivy-next-line)
      (define-key map (kbd "C-j") 'ivy-previous-line))
    (define-key ivy-minibuffer-map (kbd "H-i") (kbd "DEL"))
    (define-key counsel-find-file-map (kbd "H-i") 'counsel-up-directory)
    (define-key ivy-minibuffer-map (kbd "C-k") 'ivy-alt-done)
    (define-key ivy-minibuffer-map (kbd "<escape>") 'minibuffer-keyboard-quit))
   (t
    (define-key ivy-minibuffer-map (kbd "C-j") 'ivy-alt-done)
    (define-key ivy-minibuffer-map (kbd "C-k") 'ivy-kill-line)
    (define-key ivy-minibuffer-map (kbd "C-h") nil)
    (define-key ivy-minibuffer-map (kbd "C-l") nil))))

(defun spacemacs//helm-ijkl-navigation (style)
  "Set navigation on 'ijkl' for the given editing STYLE."
  (cond
   ((or (eq 'vim style)
        (and (eq 'hybrid style)
             hybrid-style-enable-ijkl-bindings))
    (define-key helm-map (kbd "C-h") 'nil)
    (define-key helm-map (kbd "C-S-h") 'describe-key)
    (define-key helm-map (kbd "C-l") 'helm-next-line)
    (define-key helm-map (kbd "C-j") 'helm-previous-line)
    (define-key helm-map (kbd "C-S-l") 'helm-follow-action-forward)
    (define-key helm-map (kbd "C-S-j") 'helm-follow-action-backward)
    (define-key helm-map (kbd "C-k") (kbd "RET"))
    (with-eval-after-load 'helm-files
      (dolist (keymap (list helm-find-files-map helm-read-file-map))
        (define-key keymap (kbd "C-h") 'nil)
        (define-key keymap (kbd "C-S-h") 'describe-key)
        (define-key keymap (kbd "C-l") 'nil)
        (define-key keymap (kbd "C-k") 'helm-execute-persistent-action)
        (define-key keymap (kbd "H-i") 'helm-find-files-up-one-level))))
   (t
    (define-key helm-map (kbd "C-j") 'helm-execute-persistent-action)
    (define-key helm-map (kbd "C-k") 'helm-delete-minibuffer-contents)
    (define-key helm-map (kbd "C-h") nil)
    (define-key helm-map (kbd "C-l") 'helm-recenter-top-bottom-other-window))))

(defun spacemacs//markdown-ijkl-promotion-demotion (style)
  "Set promotion/demotiion on 'ijkl' for the given editing STYLE."
  (when (or (eq 'vim style)
            (and (eq 'hybrid style)
                 hybrid-style-enable-ijkl-bindings))
    (dolist (s '(normal insert))
      (evil-define-key s markdown-mode-map
        (kbd "M-h") 'nil
        (kbd "M-j") 'markdown-promote
        (kbd "M-k") 'markdown-move-down
        (kbd "M-i") 'markdown-move-up
        (kbd "M-l") 'markdown-demote))))
