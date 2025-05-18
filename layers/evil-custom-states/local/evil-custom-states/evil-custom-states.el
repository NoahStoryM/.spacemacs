;;; evil-custom-states.el --- Custom states -*- lexical-binding: t -*-

(require 'evil)

(evil-define-state custom-motion
  "Custom motion state."
  :tag " *M* "
  :enable (motion)
  :suppress-keymap t)

(evil-define-state custom-normal
  "Custom normal state.
AKA \"Command\" state."
  :tag " *N* "
  :enable (custom-motion)
  (cond
   ((evil-custom-normal-state-p)
    (overwrite-mode -1)
    (add-hook 'post-command-hook #'evil-normal-post-command nil t))
   (t
    (remove-hook 'post-command-hook #'evil-normal-post-command t))))

(evil-define-command evil-force-custom-normal-state ()
  "Switch to custom normal state without recording current command."
  :repeat abort
  :suppress-operator t
  (evil-custom-normal-state))

(provide 'evil-custom-states)
